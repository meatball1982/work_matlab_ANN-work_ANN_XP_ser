clear all
clc

%% outline
% use 3-20 ser 
% loop train ANN to predict 21-60 ser.
% add err ser into trainning set in each loop.
% till all predicted ser in acceptable range

%% main part

% % cd path
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% data prepairation

% load firsrt trainning data 3-20 ser data
load Mat_320_dis_input_output.mat

% load firsrt trainning data 21-60 ser data
load Mat_2160_dis_input_output.mat

%% path parameters
path_en_loop_save='../res_data/en/en_atom_dis_cluster_320_loop_pre_2160/';

%% parameters predefine

% server use %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nnt_epochs_en    = 2*10^5;        % nnt max iteration number
% n_val_new        = 1000;          % add new ser number
% er_thred         = 3;             % max error en trans =en er *627.5 
% Er_rat_max       = 0.01;          % er ser in all validation set, a ratio
% nnt_epoch_en_add = 1000;          % ann iteration add. 

% test use   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nnt_epochs_en      = 1*10^2;  
n_val_new          = 500;
er_thred           = 10;                    
Er_rat_max         = 0.05;
nnt_epoch_en_add   = 10;

%% first  train part

% train en ann net
tr_rat = 0.95;                        % train percents
n_con  = length(dat320_in);           % rotamer number
n_tr   = floor(tr_rat*n_con);         % train number
n_val  = n_con-n_tr;                  % validation number

% choose train and sim data. 
[ind_tra,ind_val] = fun_rand_cho_ind(n_con,n_tr);

% choose train data
dat_in_tr=dat320_in(ind_tra,:);  dat_En_tr=dat320_En(ind_tra,:);
dat_Ch_tr=dat320_Ch(ind_tra,:);

% choose val index
dat_in_va=dat320_in(ind_val,:);  dat_En_va=dat320_En(ind_val,:);
dat_Ch_va=dat320_Ch(ind_val,:);

% normal input data
[in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);

% net parameters
% % nnt_epochs_en = 2*10^5;
% nnt_epochs_en = 1*10^1;  

nnt_goal_en  = 1e-5;
show_NaN      = NaN;     nnt_lr       = 0.05;  nnt_mc = 0.9;

% gen net
net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
net_en.trainParam.showWindow=0;                              % show training
[out_tr_pr_en,out_va_pr_en,er_tr_en,er_va_en,net_tr_en]=...
          fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_va,dat_En_va,net_en);
      
save([path_en_loop_save,'Mat_loop_320_pre_2160_0_',mat2str(nnt_epochs_en),'.mat']);

load([path_en_loop_save,'Mat_loop_320_pre_2160_0_',mat2str(nnt_epochs_en),'.mat']);

%% loop train part

% random choose 500 ser from 21-60 ser as validation set
n_con2160 = length(dat2160_in);
% n_val_new = 1000;
% % n_val_new = 5000;

[ind_val_new,ind_tm] = fun_rand_cho_ind(n_con2160,n_val_new);

% first validation data set
dat_in_val_new=dat2160_in(ind_val_new,:);     dat2160_in(ind_val_new,:)=[];
dat_En_val_new=dat2160_En(ind_val_new,:);     dat2160_En(ind_val_new,:)=[];
dat_Ch_val_new=dat2160_Ch(ind_val_new,:);     dat2160_Ch(ind_val_new,:)=[];

dat_in_va=[dat_in_va;dat_in_val_new];
dat_En_va=[dat_En_va;dat_En_val_new];
dat_Ch_va=[dat_Ch_va;dat_Ch_val_new];

% predict validation data set
[dat_En_va_pre] = fun_ANN_pre_1net_trained...
                            (dat_in_tr,dat_En_tr,dat_in_va,net_tr_en);
% judege parameters
% er_thred=5; 
% %er_thred=20; 
% Er_rat_max=0.01;
                   
% find the big err data
ind_er=abs(dat_En_va_pre-dat_En_va)*627.2 > er_thred;
n_er=sum(ind_er);

% % nnt_epoch_en_add=1000;
% nnt_epoch_en_add=10;

ite_con=1;

while (n_er/length(dat_in_va) > Er_rat_max) && (length(dat2160_in)>0)
    
    er_rat_now=n_er/length(dat_in_va)
    
    % add er data into train set
    tm=dat_in_va(ind_er,:); dat_in_tr=[dat_in_tr;tm];
    tm=dat_En_va(ind_er,:); dat_En_tr=[dat_En_tr;tm];
    tm=dat_Ch_va(ind_er,:); dat_Ch_tr=[dat_Ch_tr;tm];
    
    dat_in_va(ind_er,:)=[];
    dat_En_va(ind_er,:)=[];
    dat_Ch_va(ind_er,:)=[];
    
    clear tm
    
    % normal input data
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);
    
    nnt_epochs_en = nnt_epochs_en + nnt_epoch_en_add;
    
    % gen net
    net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
    net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
    net_en.trainParam.showWindow=0;                              % show training
    [out_tr_pr_en,out_va_pr_en,er_tr_en,er_va_en,net_tr_en]=...
        fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_va,dat_En_va,net_en);
    
    % random choose 500 ser from 21-60 ser as validation set
    n_con2160 = length(dat2160_in);
    if n_con2160 < n_val_new
        break;
    end
    [ind_val_new,ind_tm] = fun_rand_cho_ind(n_con2160,n_val_new);
    
    % first validation data set
    dat_in_val_new=dat2160_in(ind_val_new,:); dat2160_in(ind_val_new,:)=[];
    dat_En_val_new=dat2160_En(ind_val_new,:); dat2160_En(ind_val_new,:)=[];
    dat_Ch_val_new=dat2160_Ch(ind_val_new,:); dat2160_Ch(ind_val_new,:)=[];
    
    dat_in_va=[dat_in_va;dat_in_val_new];
    dat_En_va=[dat_En_va;dat_En_val_new];
    dat_Ch_va=[dat_Ch_va;dat_Ch_val_new];
    
    % predict validation data set
    [dat_En_va_pre] = fun_ANN_pre_1net_trained...
                            (dat_in_tr,dat_En_tr,dat_in_va,net_tr_en);
    
    % find the big err data
    ind_er=abs(dat_En_va_pre-dat_En_va)*627.2 > er_thred;
    n_er=sum(ind_er);
    
    save([path_en_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),'_',mat2str(nnt_epochs_en),'.mat'])
    ite_con=ite_con+1
end

save([path_en_loop_save,'Mat_loop_320_pre_2160_final_',mat2str(nnt_epochs_en),'.mat']);


%% flowchart 
% while (numb(pred err) > nerrbig )
%      add ( err ser ) into trainning set
%      add ( acc ser ) into validation set
%      train en ann net
%      choose  500 ser from 21-60 ser to validation set
%      pred validation set
% end


%% logs
% mod : 11-Mar-2014 14:44:28
% save Matout
% 
% mod : 2014年 03月 08日 星期六 21:33:14 HKT
% first run 
% mod : 08-Mar-2014 20:18:15
% 
% mod : 08-Mar-2014 11:16:53
% add flowchart
% 
% mod : 07-Mar-2014 14:05:27

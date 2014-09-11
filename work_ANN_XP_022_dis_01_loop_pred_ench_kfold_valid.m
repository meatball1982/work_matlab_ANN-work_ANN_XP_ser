clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use 3-20 ser
% loop train ANN to predict 21-60 ser.
% add err ser into trainning set in each loop.
% till all predicted ser in acceptable range
% use the k-fold to validate the net predicted result

%% main part
% %% cd path
% %% server %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% %% w530   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% data prepairation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load firsrt trainning data 3-20 ser data
load Mat_320_dis_input_output.mat

% load firsrt trainning data 21-60 ser data
load Mat_2160_dis_input_output.mat


n_con320  = length(dat320_En);
n_con2160 = length(dat2160_En);

%% path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_en_loop_save='../res_data/en/en_atom_dis_cluster_320_2160_kfold/'; 

%% parameters predefine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% server use %%%%%%%%%%%%%%%%%%%%%%%%%%%%%d
% nnt_epochs_en    = 2*10^4;          % nnt max iteration number
% n_val_new        = 1000;            % add new ser number
% er_thred         = 3;               % max error en trans =en er *627.5
% Er_rat_max       = 0.01;            % er ser in all validation set, a ratio
% nnt_epoch_en_add = 1000;            % ann iteration add.
% n_kfold          = 10;              % number of k-folder
% suc_con_max      = 3;               % 

% test use   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nnt_epochs_en      = 0.5*10^1;
n_val_new          = 500;
er_thred           = 10;
Er_rat_max         = 0.05;
nnt_epoch_en_add   = 3;
n_kfold            = 5;
suc_con_max        = 2;
% [dat_En_va_final] = fun_ANN_pre_1net_trained...
%         (dat_in_tr,dat_En_tr,dat_in_va,net_tr_en);

%% first  k-fold train net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k-fold split data into parts
% ind_ori=[1:n_con320];
% [ind_kf_mat]=fun_Kfold_choose_ind(ind_ori,n_kfold);
% 
% % loop k-fold train net
% 
% n_er=n_con320;                        % initial er number
% % for i=1:n_kfold
% for i=1:2
%     i
%     % k-fold choose data水准
%     tm=ind_kf_mat;
%     ind_val = tm(i,:);    % validation index
%     tm(i,:)=[];
%     ind_tra = tm(:)';     % train      index
%     
%     % choose train data
%     dat_in_tr=dat320_in(ind_tra,:);  dat_En_tr=dat320_En(ind_tra,:);
%     dat_Ch_tr=dat320_Ch(ind_tra,:);
%     
%     % choose val index
%     dat_in_va=dat320_in(ind_val,:);  dat_En_va=dat320_En(ind_val,:);
%     dat_Ch_va=dat320_Ch(ind_val,:);
%     
%     % normal input data
%     [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);
%     
%     % net parameters
%     nnt_goal_en  = 1e-5;    show_NaN      = NaN;     nnt_lr    = 0.05;  nnt_mc = 0.9;
%     
%     % gen net
%     net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
%     net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
%     net_en.trainParam.showWindow=1;                              % show training
% 
%     [out_tr_pr_en,out_va_pr_en,er_tr_en,er_va_en,net_tr_en]=...
%         fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_va,dat_En_va,net_en);
%     
%     % find the big err data
%     ind_er=abs(out_va_pr_en-dat_En_va)*627.2 > er_thred;
%     n_er_tm=sum(ind_er)
%     
%     % compare and choose the best split data.
%     if n_er_tm < n_er
%         n_er                = n_er_tm;            % store er number
%         ind_tra_1round      = ind_tra;            % store train index
%         ind_val_1round      = ind_val;            % store validation index
%         net_en_1round       = net_tr_en;          % store the 1round ann
%         out_tr_pr_en_1round = out_tr_pr_en;       % store the 1round train en
%         out_va_pr_en_1round = out_va_pr_en;       % store the 1round pred en
%         
%     end
%     
% end
% 
% save([path_en_loop_save,'Mat_loop_320_pre_2160_0_',mat2str(nnt_epochs_en),'_kfold.mat']);

load([path_en_loop_save,'Mat_loop_320_pre_2160_0_',mat2str(nnt_epochs_en),'_kfold.mat']);

% temp
% nnt_epoch_en_add   = 3;

%% do while loop train part %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ite_con=1;
suc_con=0;

% er_rat=n_er/length(dat_in_va);

n_len_2160=length(dat2160_En);
er_rat=1;

flg_whi_true = ( er_rat < Er_rat_max) && ( suc_ite == suc_con_max )

while  ~flg_whi_true
    disp(['ite=',mat2str(ite_con)]);
    %% predict validation set and seperate accepted Ser and unaccepted Ser %%%%%%%%%%
    % random choose 500 ser from 21-60 ser as validation set
    [ind_val_new,ind_tm] = fun_rand_cho_ind(n_len_2160,n_val_new);
    
    % first validation data set
    in_tm = dat2160_in(ind_val_new,:);     dat2160_in(ind_val_new,:) = []; 
    En_tm = dat2160_En(ind_val_new,:);     dat2160_En(ind_val_new,:) = [];
    Ch_tm = dat2160_Ch(ind_val_new,:);     dat2160_Ch(ind_val_new,:) = [];
    
    dat_in_va = [dat_in_va;in_tm];
    dat_En_va = [dat_En_va;En_tm];
    dat_Ch_va = [dat_Ch_va;Ch_tm];
    
    clear in_tm En_tm Ch_tm 
    
    % predict validation data set
    [dat_En_va_pre] = fun_ANN_pre_1net_trained...
        (dat_in_tr,dat_En_tr,dat_in_va,net_tr_en);
    
    % find the big err data
    ind_er=abs(dat_En_va_pre-dat_En_va)*627.2 > er_thred;
    n_er=sum(ind_er);
    net_tr_ennet_tr_en
    er_rat=n_er/length(dat_in_va);
%     er_rat=0.001;
        
    %% del unaccepted Ser in validation set.
    if er_rat > Er_rat_max
        % reset suc_con
        suc_con=0;
        
        % add ( err ser ) into loop training set
        in_er = dat_in_va(ind_er,:); dat_in_va(ind_er,:) = [];
        En_er = dat_En_va(ind_er,:); dat_En_va(ind_er,:) = [];
        Ch_er = dat_Ch_va(ind_er,:); danet_tr_ennet_tr_ent_Ch_va(ind_er,:) = [];
                
        % update itermax
        nnt_epochs_en = nnt_epochs_en + nnt_epoch_en_add;
        
        % k-fold mod train ann
        [ net_tr_en ] = fun_kfold_mod_train(dat_in_tr,dat_En_tr,in_er,En_er,...
                                             n_kfold,nnt_epochs_en,er_thred,n_atom);
                
    else
        if suc_con < suc_con_max
            % suc_con ++ 
            suc_con = suc_con + 1 ;

        else
            % output final trained ann
            flg_train_suc=1;
            break;
        end
    end
    % calculate er_rat
    
    % calculate n_len_2160
    n_len_2160=length(dat2160_in(:,1));
    
    flg_whi_true = ( er_rat < Er_rat_max) && ( suc_con == suc_con_max )
    
     if n_len_2160 < n_val_new
        flg_train_suc=0;
        break;
     end
    save([path_en_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),'_',mat2str(nnt_epochs_en),'_kfold.mat'])
    ite_con=ite_con+1;
     
end

save([path_en_loop_save,'Mat_loop_320_pre_2160_final_',mat2str(nnt_epochs_en),'_kfold.mat']);

%% flowchart %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% while  ~flg_whi_true    
%     % predict validation set and seperate accepted Ser and unaccepted Ser
%     % del unaccepted Ser in validation set.
%     if er_rat > Er_rat_max
%        % suc_con=0; 
%        % add ( err ser ) into loop training set
%        % k-fold mod train ann 
%        % add 500 ser from 21-60MDser into validation set    
%     else
%         if suc_ite < suc_con_max
%             % suc_con = suc_con + 1 ;
%             % choose  500 ser from 21-60 ser to validation set
%         else
%             % output final trained ann
%             flg_train_suc=1;
%             break;
%         end
%     end
%     % calculate er_rat
%     % calculate n_len_2160
%     if n_len_2160 < n_val_new
%         flg_train_suc=0;
%         break;
%     end
% end

%% logs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 21-Mar-2014 14:42:10
% 
% mod : 21-Mar-2014 09:11:22
% loop train.
% 
% mod : 20-Mar-2014 17:25:21
% main do while loop
% 
% mod : 20-Mar-2014 09:13:51
% first k-fold train ANN
% 
% mod : 18-Mar-2014 14:45:50
% add the k-fold validation.
%
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





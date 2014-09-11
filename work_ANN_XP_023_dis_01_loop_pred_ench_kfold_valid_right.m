clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use 3-20 ser
% loop train ANN to predict 21-60 ser.
% add err ser into trainning set in each loop.
% till all predicted ser in acceptable range
% use the k-fold to validate the net predicted result
% predict ch

%% main part
% %% cd path
% %% server %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% %% w530   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% data prepairation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load firsrt trainning data 3-20 ser data
load Mat_320_dis_input_output.mat dat320_Ch dat320_in

% load firsrt trainning data nnt_goal   = 21-60 ser data
load Mat_2160_dis_input_output.mat dat2160_Ch dat2160_in
  
%% path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_en_loop_save='../res_data/ch/ch_atom_dis_cluster_320_2160_kfold/'; 
% path_en_loop_save='../res_data/en/en_atom_dis_cluster_320_2160_kfold/'; 


%% parameters predefine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_con320  = length(dat320_Ch);
n_con2160 = length(dat2160_Ch);

% server use ------------------------------
% n_kfold   =   5 ;
% nnt_goal  = 1e-5; show_NaN  = 1 ; nnt_lr    = 0.05; nnt_mc     = 0.9;
% n_net_hid = 69  ; n_net_out = 23; nnt_epoch = 4e3 ; nnt_show   =   0;

% loop parameters settings----------------
% ite_con     =       1; suc_con     =       0; Er_rat_max  =   0.005;
% suc_con_max =       2; suc_ite     =       0; n_val_new   =    2000;
% er_thred    =    0.02; nnt_epoch_add =  1000;

% test use   ------------------------------
n_kfold   =   3 ;
nnt_goal  = 1e-5; show_NaN  =   1; nnt_lr    = 0.05;   nnt_mc     = 0.9;
n_net_hid = 69  ; n_net_out = 23 ; nnt_epoch = 5   ;   nnt_show   = 1;

% loop parameters settings test use -------
ite_con     =       1; suc_con     =       0; Er_rat_max  =   0.005;
suc_con_max =       2; suc_ite     =       0; n_val_new   =      20;
er_thred    =    0.01; nnt_epoch_add =    10;


% gen net parameters ----------------------
net_para.nnt_goal   = nnt_goal ;    net_para.show_NaN   = show_NaN ;
net_para.nnt_lr     = nnt_lr   ;    net_para.nnt_mc     = nnt_mc   ;
net_para.n_net_hid  = n_net_hid;    net_para.n_net_out  = n_net_out;
net_para.nnt_epoch  = nnt_epoch;    net_para.nnt_show   = nnt_show ;

%% first k-fold train net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data ------------------------------------
all_data_in  = dat320_in ;
all_data_out = dat320_Ch ;

% first train -----------------------------
[ Ind_cho_1round, net_trained ] = fun_kfold_train( ...
                                all_data_in,all_data_out,n_kfold,net_para);
% save first round Ch result
save([path_en_loop_save,'Mat_loop_320_pre_2160_0_',...
                                      mat2str(nnt_epoch),'_kfold_ch.mat']);

load([path_en_loop_save,'Mat_loop_320_pre_2160_0_',...
                                      mat2str(nnt_epoch),'_kfold_ch.mat']);
 
%% do while loop train part %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_len_2160=length(dat2160_Ch);
er_rat=1;

ind_tr=Ind_cho_1round.tr; 
ind_va=Ind_cho_1round.va;

dat_in_tr=all_data_in(ind_tr,:);
dat_in_va=all_data_in(ind_va,:);
dat_Ch_tr=all_data_out(ind_tr,:);
dat_Ch_va=all_data_out(ind_va,:);

 
flg_whi_true = ( er_rat < Er_rat_max) && ( suc_ite == suc_con_max )

while  ~flg_whi_true
    disp(['ite=',mat2str(ite_con)]);
    %% predict validation set and seperate accepted Ser and unaccepted Ser %%%%%%%%%%
    % random choose 500 ser from 21-60 ser as validation set
    [ind_val_new,ind_tm] = fun_rand_cho_ind(n_len_2160,n_val_new);
    
    % first validation data set
    in_tm = dat2160_in(ind_val_new,:);     dat2160_in(ind_val_new,:) = []; 
    Ch_tm = dat2160_Ch(ind_val_new,:);     dat2160_Ch(ind_val_new,:) = [];
    
    dat_in_va = [dat_in_va;in_tm]; 
    dat_Ch_va = [dat_Ch_va;Ch_tm];
    
    clear in_tm Ch_tm 
    
    % predict validation data set
    [dat_Ch_va_pre] = fun_ANN_pre_1net_trained...
                               (dat_in_tr,dat_Ch_tr,dat_in_va,net_trained);
    
    % find the big err data
    [ er_rat,ind_er ] = fun_find_err_big(dat_Ch_va,dat_Ch_va_pre,er_thred);
        
    %% del unaccepted Ser in validation set.
    if er_rat > Er_rat_max
        % reset suc_con
        suc_con=0;
        
        % add ( err ser ) into loop training set
        in_er = dat_in_va(ind_er,:); dat_in_va(ind_er,:) = [];
        Ch_er = dat_Ch_va(ind_er,:); dat_Ch_va(ind_er,:) = [];
        
        
        % update itermax
        nnt_epoch = nnt_epoch + nnt_epoch_add;
        net_para.nnt_epoch  = nnt_epoch;
        
        % k-fold mod train ann
        [ Ind_cho,net_tr_ch, er_rat] = fun_kfold_mod_train_V2(...
                                    dat_in_tr,dat_Ch_tr,in_er,Ch_er,...
                                    n_kfold,net_para,er_thred);
        
        % mod : 29-Apr-2014 18:52:15, add er ser into train set
        dat_in_tr=[dat_in_tr;in_er]; 
        dat_Ch_tr=[dat_Ch_tr;Ch_er];
    
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
    save([path_en_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),...
                              '_',mat2str(nnt_epoch),'_kfold_ch.mat']);
    ite_con=ite_con+1;
     
end

str1='n113 task';
str2='n113 finished';
my_send_mail(str1,str2);

% % save([path_en_loop_save,'Mat_loop_320_pre_2160_final_',mat2str(nnt_epochs_en),'_kfold.mat']);
% % 
% % %% flowchart %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % while  ~flg_whi_true    
% % %     % predict validation set and seperate accepted Ser and unaccepted Ser
% % %     % del unaccepted Ser in validation set.
% % %     if er_rat > Er_rat_max
% % %        % suc_con=0; 
% % %        % add ( err ser ) into loop training set
% % %        % k-fold mod train ann 
% % %        % add 500 ser from 21-60MDser into vafun_find_err_biglidation set    
% % %     else
% % %         if suc_ite < suc_con_max
% % %             % suc_con = suc_con + 1 ;
% % %             % choose  500 ser from 21-60 ser to validation set
% % %         else
% % %             % output final trained ann
% % %             flg_train_suc=1;
% % %             break;
% % %         end
% % %     end
% % %     % calculate er_rat
% % %     % calculate n_len_2160
% % %     if n_len_2160 < n_val_new
% % %         flg_train_suc=0;
% % %         break;
% % %     end
% % % end

%% logs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 30-Apr-2014 09:23:02
% change the er_ind to ind_er
%
% mod : 29-Apr-2014 18:57:18
% test.
% mod : 29-Apr-2014 11:03:36
% 
% mod : 28-Apr-2014 15:30:26
% predict charge use the k-fold flowchart 
% 
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





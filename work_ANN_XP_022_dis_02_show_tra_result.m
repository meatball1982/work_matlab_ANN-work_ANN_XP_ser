clear all
clc
% clf

cd /home/mm/works/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% outline 
% show the k-fold loop add ann result
nnt_epochs_en      = 1e4;
nnt_epochs_en_init = 1e4;
nnt_epoch_en_add   = 2000;

num_den=200;

fig_save_path='../imgs/en/22en_atom_dis_cluster_320_2160_kfold';

%% main part
for ite_con=1:19
% for ite_con=17:17
    if ite_con~=17%
        ite_con

    % path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    path_en_loop_save='../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/';

    nnt_epochs_en = nnt_epochs_en_init + nnt_epoch_en_add * ite_con;
    fi_mat=[path_en_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),'_',mat2str(nnt_epochs_en),'_kfold.mat']
%      load(fi_mat);

     load(fi_mat,'net_tr_en','er_thred',...
         'dat_in_tr' ,'dat_En_tr',...
         'in_er','En_er',...
         'dat_in_va' ,'dat_En_va',...
         'dat2160_in','dat2160_En'); 

     % tr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       dat_in_tr_er=[dat_in_tr;in_er];
       dat_En_tr_er=[dat_En_tr;En_er];
     [ dat_En_tr_er_pre ] = fun_ANN_pre_1net_trained...
                              (dat_in_tr,dat_En_tr,dat_in_tr_er,net_tr_en);
     [ out_in_er_pre , dat_En_tr_er_pre, pre_shift] = fun_er_static_shift_627(dat_En_tr_er,dat_En_tr_er_pre);
     Matout_in_pre(ite_con,:) = out_in_er_pre;
%      re=dat_En_tr_er;
%      si=dat_En_tr_er_pre;
%      
%      flg_str='_01tr';
%      fun_output_plot(fig_save_path,re,si,ite_con,nnt_epochs_en,num_den,flg_str);
     
     % va %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     [ dat_En_va_pre ] = fun_ANN_pre_1net_trained...
                                 (dat_in_tr,dat_En_tr,dat_in_va,net_tr_en);
     [ out_va_pre,dat_En_va_pre, pre_shift] = fun_er_static_shift_627(dat_En_va,dat_En_va_pre);
     Matout_va_pre(ite_con,:) = out_va_pre;
     ANN_shift_mat(ite_con)=pre_shift;
%      re=dat_En_va;
%      si=dat_En_va_pre;
%      
%      flg_str='_02va';
%      fun_output_plot(fig_save_path,re,si,ite_con,nnt_epochs_en,num_den,flg_str);

     
     % 2160 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     [ dat_En_2160_pre ] = fun_ANN_pre_1net_trained...
                                 (dat_in_tr,dat_En_tr,dat2160_in,net_tr_en);
     [ out_2160_pre ,dat_En_2160_pre, pre_shift] = fun_er_static_shift_627(dat2160_En,dat_En_2160_pre);
     Matout_2160_pre(ite_con,:) = out_2160_pre;
%      re=dat2160_En;
%      si=dat_En_2160_pre;
%      
%      flg_str='_032160';
%      fun_output_plot(fig_save_path,re,si,ite_con,nnt_epochs_en,num_den,flg_str); 
    end
end


save Mat_n84_kfold_res.mat

%% logs
% mod : 21-May-2014 10:33:19
% add pre shift
% mod : 24-Apr-2014 08:54:30
% mod : 23-Apr-2014 18:00:13
% 
% mod : 21-Apr-2014 11:42:03
% 

%% rub and backup

% load('../res_data/en/en_atom_dis_cluster_320_2160_kfold/Mat_loop_320_pre_2160_1_12000_kfold.mat');

% load('../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/Mat_loop_320_pre_2160_5_20000_kfold.mat')

% load('../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/Mat_loop_320_pre_2160_10_30000_kfold.mat')

% load('../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/Mat_loop_320_pre_2160_15_40000_kfold.mat')

% load('../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/Mat_loop_320_pre_2160_18_46000_kfold.mat')

% load('../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/Mat_loop_320_pre_2160_19_48000_kfold.mat')


% [dat_En_va_final] = fun_ANN_pre_1net_trained...
%         (dat_in_tr,dat_En_tr,dat_in_tr,net_tr_en);
    

% [dat_En_va_final] = fun_ANN_pre_1net_trained...
%         (dat_in_tr,dat_En_tr,dat_in_va,net_tr_en);
    
% figure(1)   
% densityplot(dat_En_tr,dat_En_va_final,100,10)
% % plot(dat_En_va,dat_En_va_final,'.')
% grid on
% 
% figure(2)
% % h=fun_plot_res_sqr(dat_En_va,dat_En_va_final,'en va ');
% h=fun_plot_res_sqr(dat_En_tr,dat_En_va_final,'en va ');

% save Mat_kfold_res_tmp.mat dat_En_tr dat_En_va_final dat_En_va


% [dat_En_va_2160] = fun_ANN_pre_1net_trained...
%          (dat_in_tr,dat_En_tr,dat2160_in,net_tr_en);
% 
% save Mat_kfold_res_tmp.mat dat_En_tr dat_En_va_2160 dat2160_En

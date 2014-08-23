clear all
clc

%% outline
% temp load the firest round of Ch net.
% to judege the ann error thredhold

%% main
%
cd '/home/mm/works/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files'

path_ch_loop_save='../res_data/ch/ch_atom_dis_cluster_320_2160_kfold/';
% path_ch_loop_save='../res_data/ch/ch_atom_dis_cluster_320_loop_pre_2160/';
% fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_0_4000_kfold_ch.mat'];
% fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_1_5000_kfold_ch.mat'];
% fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_2_6000_kfold_ch.mat'];
% fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_3_7000_kfold_ch.mat'];
% fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_4_8000_kfold_ch.mat'];
% fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_5_9000_kfold_ch.mat'];

% load(fi_mat)

nnt_epochs_ch_init = 4000;
nnt_epoch_ch_add   = 1000;
num_den=200;

fig_save_path='../imgs/ch/23ch_atom_dis_cluster_320_2160_kfold';

for ite_con=1:5
% for ite_con=1:2
    ite_con
    % path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    path_ch_loop_save='../res_data/ch/ch_atom_dis_cluster_320_2160_kfold/';

    
    nnt_epochs_ch = nnt_epochs_ch_init + nnt_epoch_ch_add * ite_con;
    fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),...
                               '_',mat2str(nnt_epochs_ch),'_kfold_ch.mat'];
%     load(fi_mat);                       
    load(fi_mat,'all_data_in','all_data_out','dat_in_tr','dat_Ch_tr',...
        'in_er','Ch_er','net_tr_ch','er_thred','dat_in_va' ,'dat_Ch_va',...
        'dat2160_in','dat2160_Ch')

        
     % tr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       dat_in_tr_er=[dat_in_tr;in_er];
       dat_Ch_tr_er=[dat_Ch_tr;Ch_er];
     [ dat_Ch_tr_er_pre ] = fun_ANN_pre_1net_trained...
                              (dat_in_tr,dat_Ch_tr,dat_in_tr_er,net_tr_ch);
     [out_in_er_pre]=fun_er_static_V5(dat_Ch_tr_er,dat_Ch_tr_er_pre,er_thred)
     Matout_in_pre(ite_con,:) = out_in_er_pre;
     
     
     re=dat_Ch_tr_er;
     si=dat_Ch_tr_er_pre;
     
     flg_str='_01tr';
     fun_output_plot_ch(fig_save_path,re(:),si(:),ite_con,nnt_epochs_ch,num_den,flg_str);

     
     % va %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     [ dat_Ch_va_pre ] = fun_ANN_pre_1net_trained...
                                 (dat_in_tr,dat_Ch_tr,dat_in_va,net_tr_ch);
     [ out_va_pre] = fun_er_static_V5(dat_Ch_va,dat_Ch_va_pre,er_thred);
     Matout_va_pre(ite_con,:) = out_va_pre;

     re=dat_Ch_va;
     si=dat_Ch_va_pre;
     
     flg_str='_02va';
     fun_output_plot_ch(fig_save_path,re(:),si(:),ite_con,nnt_epochs_ch,num_den,flg_str);

     % tr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       dat_in_tr_er=[dat_in_tr;in_er];
       dat_Ch_tr_er=[dat_Ch_tr;Ch_er];
     [ dat_Ch_tr_er_pre ] = fun_ANN_pre_1net_trained...
                              (dat_in_tr,dat_Ch_tr,dat_in_tr_er,net_tr_ch);
     [out_in_er_pre]=fun_er_static_V5(dat_Ch_tr_er,dat_Ch_tr_er_pre,er_thred)
     Matout_in_pre(ite_con,:) = out_in_er_pre;
     
     
     re=dat_Ch_tr_er;
     si=dat_Ch_tr_er_pre;
     
     flg_str='_01tr';
     fun_output_plot_ch(fig_save_path,re(:),si(:),ite_con,nnt_epochs_ch,num_den,flg_str);

     
     % va %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     [ dat_Ch_va_pre ] = fun_ANN_pre_1net_trained...
                                 (dat_in_tr,dat_Ch_tr,dat_in_va,net_tr_ch);
     [ out_va_pre] = fun_er_static_V5(dat_Ch_va,dat_Ch_va_pre,er_thred);
     Matout_va_pre(ite_con,:) = out_va_pre;

     re=dat_Ch_va;
     si=dat_Ch_va_pre;
     
     flg_str='_02va';
     fun_output_plot_ch(fig_save_path,re(:),si(:),ite_con,nnt_epochs_ch,num_den,flg_str);

      % 2160 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     [ dat_Ch_2160_pre ] = fun_ANN_pre_1net_trained...
                                 (dat_in_tr,dat_Ch_tr,dat2160_in,net_tr_ch);
     [ out_2160_pre ] = fun_er_static_V5(dat2160_Ch,dat_Ch_2160_pre,er_thred);
     Matout_2160_pre(ite_con,:) = out_2160_pre;
     re=dat2160_Ch;
     si=dat_Ch_2160_pre;     
     flg_str='_032160';
     fun_output_plot_ch(fig_save_path,re(:),si(:),ite_con,nnt_epochs_ch,num_den,flg_str); 
     
end

% save Mat_ch_kfold_static.mat

% ind_tra=Ind_cho_1round.tr;
% ind_val=Ind_cho_1round.va;
% 
% % choose train data---------------------
% dat_in_tr  = [ all_data_in(ind_tra,:)  ];
% dat_out_tr = [ all_data_out(ind_tra,:) ];
% 
% % choose valid data---------------------
% dat_in_va  = [ all_data_in(ind_val,:)  ];
% dat_out_va = [ all_data_out(ind_val,:) ];
% 
% [ dat_out_va_pre ] = fun_ANN_pre_1net_trained...
%                               (dat_in_tr,dat_out_tr,dat_in_va,net_trained);
% 
% % 
% % clf
% plot(dat_out_va,dat_out_va_pre,'.')
% h=fun_plot_res_sqr(dat_out_va,dat_out_va_pre,'ch va 1 round ');
% % fi_na=['../imgs/ch/23ch_atom_dis_cluster_320_2160_kfold/n113/loop_320_pre_2160_1_4000_kfold_ch_va'];
% % fun_work_li_035_myfig_out(h,fi_na,3);
% 
% 
% % 
% er_va=dat_out_va-dat_out_va_pre;
% % [hi_va,hi_bi]=hist(er_va(:),60);
% % h=bar(hi_bi,hi_va);
% % fi_na=['../imgs/ch/23ch_atom_dis_cluster_320_2160_kfold/n113/loop_320_pre_2160_1_4000_kfold_ch_va_hist'];
% % fun_work_li_035_myfig_out(h,fi_na,3);
% 
% er_rat=sum(abs(er_va(:))>0.02)/length(er_va(:));
% 

%% logs
% mod : 12-May-2014 10:21:38
% loop static ch result
% 
% mod : 06-May-2014 13:46:18

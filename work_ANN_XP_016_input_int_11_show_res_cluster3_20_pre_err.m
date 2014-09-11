clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% show en, ch results with trained net 
% plus 3-20Dia  cluster. each has 2500 ser

% choose one trained net.
% use XP gen ser 3-20 dia int  as input 
% atom int as ANN input
% en 
% mu ch as output
% 

%% load data en %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % load trained ANN net data.                              %%%%%%%%%%%%%%%%%
% ANN data 

path_ann_train='../res_data/en/en_atom_int_cluster/';
na_ann_train='Mat_atom_int_cluster_3_20Dia_trper80_ite_12000_rep_1.mat';

fi_na=[path_ann_train,na_ann_train];
load(fi_na)
ind_sim=t_tmp((n_tr+1):end);
dat_in_pr=dat_in(ind_sim,:);
dat_En_pr=dat_En(ind_sim,:);
dat_Ch_mu_pr=dat_Ch(ind_sim,:);

%% predict En err
[out_si_pr_en_new] = ...
         fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);

% h=fun_plot_res_sqr(dat_En_pr,out_si_pr_en_new,['si 3-20dia ser cong']);
% fi_na=['../imgs/en/16en_atom_int_cluster/en/en_trper80_12000_pr'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
 h=fun_plot_res_sqr(dat_En_tr,out_si_pr_en,['si 3-20dia ser cong tr']);
fi_na=['../imgs/en/16en_atom_int_cluster/en/en_trper80_12000_tr'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% % cla ch si r and a,b
fun_mm_stat_R2kb(dat_En_pr,out_si_pr_en_new);



%% load data ch %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % load trained ANN net data.                   d           %%%%%%%%%%%%%%%%%
% % ANN data 
% 
% path_ann_train='../res_data/ch/ch_atom_int_cluster/';
% na_ann_train='Mat_atom_int_cluster_3_20Dia_trper80_ite_5000_rep_1.mat';
% 
% fi_na=[path_ann_train,na_ann_train];
% load(fi_na)
% ind_sim=t_tmp((n_tr+1):end);
% dat_in_pr=dat_in(ind_sim,:);
% dat_Ch_mu_pr=dat_Ch(ind_sim,:);
% 
% %% predict Ch err
% [out_si_pr_ch_new] = ...
%          fun_ANN_pre_1net_trained(dat_in_tr,dat_Ch_mu_tr,dat_in_pr,net_tr_ch_mull);
% 
% % h=fun_plot_res_sqr(dat_Ch_mu_pr,out_si_pr_ch_new,['si 3-20dia ser cong ch']);
% % fi_na=['../imgs/ch/16ch_atom_int_cluster/ch/ch_trper80_12000_pr'];
% % fun_work_li_035_myfig_out(h,fi_na,3);
% 
%  h=fun_plot_res_sqr(dat_Ch_mu_tr,out_tr_pr_ch_mull,['si 3-20dia ser cong tr ch']);
% fi_na=['../imgs/ch/16ch_atom_int_cluster/ch/ch_trper80_12000_tr'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% % cla ch si r and a,b
% fun_mm_stat_R2kb(dat_Ch_mu_pr,out_si_pr_ch_new);

%% logs
% mod : 01-Mar-2014 10:29:10
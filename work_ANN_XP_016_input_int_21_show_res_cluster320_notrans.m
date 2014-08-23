clear all
clc


%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% show en, ch results with trained net 
% plus 3-20Dia  cluster. each has 2500 ser 

% choose one trained net.
% use XP gen ser 3-20 dia int as input 
% atom int as ANN input
% en (no transform)
% 


%% load data en %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % load trained ANN net data.                            %%%%%%%%%%%%%%%%%
% % ANN data 


% n81 cal 
path_ann_train='../res_data/en/en_atom_int_cluster/n81/';
na_ann_train='Mat_atom_int_cluster_3_20Dia_trper80_ite_300000_rep_1_notrans.mat';

% path_ann_train='../res_data/en/en_atom_int_cluster/';
% na_ann_train='Mat_atom_int_cluster_3_20Dia_trper80_ite_30000_rep_1_notrans.mat';
 
fi_na=[path_ann_train,na_ann_train];
load(fi_na)
ind_sim=t_tmp((n_tr+1):end);

h=fun_plot_res_sqr(dat_En_tr,out_tr_pr_en,['si 3-20dia 300000 ser cong tr notrans']);
fi_na=['../imgs/en/16en_atom_int_cluster/en/en_trper80_300000_tr_notrans'];
fun_work_li_035_myfig_out(h,fi_na,3);



% dat_in_pr=dat_in(ind_sim,:);
% dat_En_pr=dat_En(ind_sim,:);
% dat_Ch_mu_pr=dat_Ch(ind_sim,:);
% 
% h=fun_plot_res_sqr(dat_En_tr,out_tr_pr_en,['si 3-20dia 30000 ser cong tr notrans']);
% fi_na=['../imgs/en/16en_atom_int_cluster/en/en_trper80_30000_tr_notrans'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% predict En err
% [out_si_pr_en_new] = ...
%          fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
% 
% h=fun_plot_res_sqr(dat_En_pr,out_si_pr_en_new,['si 3-20dia ser cong']);
% fi_na=['../imgs/en/16en_atom_int_cluster/en/en_trper80_12000_pr'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% logs
% mod : 11-Mar-2014 10:21:30
% plot 3-20 ser no trans, en, 30000ite. tr result.
% 
% mod : 10-Mar-2014 16:57:58

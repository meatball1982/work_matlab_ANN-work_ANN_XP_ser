clear all
clc
clf

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pre en with trained net
% rand 6000, rmsd 2000
% 
% choose one best trained net.
% use XP gen new random ser 16,20,41,60, each group choose about 500 ser 
% atom dis as ANN input
% 

%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load trained ANN net data. the rand 6000 +2000 *5 group %%%%%%%%%%%%%%%%%
% ANN data 
% path_ann_train='../res_data/en/en_atom_dis_rand_6000_315ser/';
% % na_ann_train='Mat_atom_dis_rand6000_315ser_trper100_ite_8000_rep_1_del_0_add_5.mat';
% na_ann_train='Mat_atom_dis_rand6000_315ser_trper100_ite_17000_rep_1_del_0_add_5ase.mat';
% %na_ann_train='Mat_atom_dis_rand6000_315ser_trper100_ite_12000_rep_1_del_0_add_5big_hidden';
% 
% fi_na=[path_ann_train,na_ann_train];
% % load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');
% load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en');
% 
% % load new random choose ser ANN data. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dat_in_pr   = load('../data/ANN_input_out_file_anntest/ANN_in_dis.txt');
% dat_En_pr   = load('../data/ANN_input_out_file_anntest/ANN_HF_en_anntest.txt');
% 
% %% predict En err
% [out_si_pr_en_new] = ...
%          fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
% 
% % save Mat_en_XP_anntest.mat
% 
% 
% 
% re=dat_En_pr;
% si=out_si_pr_en_new;
% 
% ind=find(abs(si-re)>0.01);


load Mat_tm_Pr.mat


% h=fun_plot_res_sqr(dat_En_tr,out_si_pr_en,['tr 3-15 16000 abs er tr']);
% fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_tr/fig_en_17000_tr_ase_congress'];
% fun_work_li_035_myfig_out(h,fi_na,3);


% h=fun_plot_res_sqr(re,si,['pr 17-60 rand 10000']);
% hold on
% plot(re(ind),si(ind),'ro')
% fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_pr/fig_en_17000_pr_ase_congress'];
% fun_work_li_035_myfig_out(h,fi_na,3);

h=fun_plot_res_sqr(dat_En_tr,out_si_pr_en,['tr 3-15 rand 16000, big hidden']);
fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_tr/fig_en_16000_tr_big_hidden_congress'];
fun_work_li_035_myfig_out(h,fi_na,3);


% h=fun_plot_res_sqr(re,si,['pr 17-60 rand 10000 big hidden']);
% hold on
% plot(re(ind),si(ind),'ro')
% fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_pr/fig_en_12000_pr_big_hidden_congress'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% logs 
% mod : 12-Dec-2013 15:17:24
% change the ann mse into ase to predict.

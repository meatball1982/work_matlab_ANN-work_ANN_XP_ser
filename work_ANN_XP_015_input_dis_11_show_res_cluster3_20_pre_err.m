clear all
clc

clear all
clc
clf

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pre en with trained net
% plus 3-20Dia  cluster. each has 2500 ser

% choose one trained net.
% use XP gen new random ser 17-60, ser test as input 
% atom dis as ANN input
% 

%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load trained ANN net data.                              %%%%%%%%%%%%%%%%%
% ANN data 

% path_ann_train='../res_data/en/en_atom_dis_cluster/';
% na_ann_train='Mat_atom_dis_cluster_3_20Dia_trper100_ite_100_ch_cluster3_2000_rep_1.mat';
%  
% fi_na=[path_ann_train,na_ann_train];
% load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');
%  
% % load new random choose ser ANN data. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dat_in_pr   = load('../data/ANN_input_out_file_anntest/ANN_in_dis.txt');
% dat_En_pr   = load('../data/ANN_input_out_file_anntest/ANN_HF_en_anntest.txt');
% 
% %% predict En err
% [out_si_pr_en_new] = ...
%          fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
% 
% re=dat_En_pr;
% si=out_si_pr_en_new;
% ind=find(abs(si-re)>0.01);
% 
% save Mat_en_XP_anntest_cluster3_20.mat

load Mat_en_XP_anntest_cluster3_20.mat

h=fun_plot_res_sqr(dat_En_tr,out_si_pr_en,['tr cluster abs er tr']);
fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_tr/fig_en_17000_tr_ase_congress'];
fun_work_li_035_myfig_out(h,fi_na,3);

% 
% h=fun_plot_res_sqr(re,si,['pr 17-60 rand 10000']);
% hold on
% plot(re(ind),si(ind),'ro')
% fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_pr/fig_en_17000_pr_ase_congress'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% h=fun_plot_res_sqr(dat_En_tr,out_si_pr_en,['tr 3-15 rand 16000, big hidden']);
% fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_tr/fig_en_16000_tr_big_hidden_congress'];
% fun_work_li_035_myfig_out(h,fi_na,3);



%% logs 
% mod : 30-Dec-2013 11:10:42
% 

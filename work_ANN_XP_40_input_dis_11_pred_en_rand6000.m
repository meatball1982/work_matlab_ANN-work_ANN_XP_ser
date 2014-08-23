clear all
clc

%% outline
% pre en with trained net
% 
% choose one best trained net.
% use XP gen new random ser, from Protein 
% atom dis as ANN input
% 

%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load trained ANN net data. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tr_rat_str='100';
% nnt_epochs_en=8500;
% i=1;
% fi_na=['../res_data/en/en_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
%       tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
% % load(fi_na)
% load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');
% 
% % load new random choose ser ANN data. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dat_in_pr   = load('../data/ANN_input_out_file_pot/ANN_in_dis_pot.txt');
% dat_En_pr   = load('../data/ANN_input_out_file_pot/EuHF_ANN_pot');
% 
% 
% %% predict En err
% [out_si_pr_en_new] = ...
%          fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
%      
% save Mat_en_XP_pot_err.mat
% 
% %% predict En without err ser
% ind=dat_En_pr<-567.52;
% [out_si_pr_en_new] = ...
%          fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr(ind,:),net_tr_en);
% 
% save Mat_en_XP_pot_without_err.mat




% load trained ANN net data. the rand 6000 +2000 *5 group %%%%%%%%%%%%%%%%%
% ANN data 
path_ann_train='../res_data/en/en_atom_dis_rand_6000_315ser/';
na_ann_train='Mat_atom_dis_rand6000_315ser_trper100_ite_8000_rep_1_del_0_add_5.mat';

fi_na=[path_ann_train,na_ann_train];
load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');

% load new random choose ser ANN data. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat_in_pr   = load('../data/ANN_input_out_file_pot/ANN_in_dis_pot.txt');
dat_En_pr   = load('../data/ANN_input_out_file_pot/EuHF_ANN_pot');

ind=dat_En_pr<-567.52;

%% predict En err
[out_si_pr_en_new] = ...
         fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr(ind,:),net_tr_en);
     
save Mat_en_XP_pot_err_16000.mat

%% logs
% mod : 11-Dec-2013 06:20:22
% mod : 07-Dec-2013 20:42:35
% 2 predict the ser which XP draw fro pot.
%
% mod : 07-Dec-2013 14:40:47
% 
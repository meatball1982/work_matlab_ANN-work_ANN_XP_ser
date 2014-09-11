clear all
clc

%% load trained ANN data
tr_rat_str=mat2str(100);
fi_na=['../res_data/en/en_atom_dis_errfix01_pre_err/Mat_atom_dis_errfix01_trper',...
    tr_rat_str,'_ite_700_rep_1_del_0.mat'];
load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');

% load pre dat
dat_in_pr = load(['../data/ANN_input_out_file_500/err_ser/ANN_in_dis.txt']);
dat_En_pr = load(['../data/ANN_input_out_file_500/err_ser/ANN_HF_en_errser.txt']);

% predict En err %%%%%%%%%%%%%%%%%%%%%%%%%%
[out_si_pr_en_new] = ...
         fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);

x_ind=[1:length(out_si_pr_en_new)];
plot(x_ind,dat_En_pr,'b.-',x_ind,out_si_pr_en_new,'ro-')

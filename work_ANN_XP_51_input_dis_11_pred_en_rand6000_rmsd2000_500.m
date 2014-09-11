clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pre en with trained net
% rand 6000, rmsd 2000
% 
% choose one best trained net.
% use XP gen new random ser 16,20,41,60, each group choose about 500 ser 
% atom dis as ANN input
% 

%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load trained ANN net data. %%%%%%%%%%%%%%%%%%
tr_rat=1;
tr_rat_str=mat2str(100*tr_rat);
i=1;
nnt_epochs_en=7500;

fi_na=['../res_data/en/en_atom_dis_rand_6000_rmsd2k/Mat_atom_dis_rand6000_rmsd2k_trper',...
      tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];

load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');
 
% md 16,20,41,60 ser. 500 %%%%%%%%%%%%%%%%%%%%%
na_list=[16,20,41,60];
% na_list=[16,41];

%% pre the en . %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(na_list)

    na_ser=mat2str(na_list(i));
    % load new random choose ser ANN data. %%%%
    dat_in_pr = load(['../data/ANN_input_out_file_500/',...
        na_ser,'ser/ANN_in_dis.txt']);
    dat_En_pr = load(['../data/ANN_input_out_file_500/',...
        na_ser,'ser/ANN_HF_en_',mat2str(na_list(i)),'ser500.txt']);
    
    % predict En err %%%%%%%%%%%%%%%%%%%%%%%%%%
    [out_si_pr_en_new] = ...
        fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
    
    % store the pre result %%%%%%%%%%%%%%%%%%%% 
    na_fi_store=['../res_data/Pre_res_data/rand6000_rmsd2000/Mat_',na_ser,'ser500.mat'];
    save(na_fi_store);
    
end

%% logs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 08-Dec-2013 10:53:06
% the en prediction.


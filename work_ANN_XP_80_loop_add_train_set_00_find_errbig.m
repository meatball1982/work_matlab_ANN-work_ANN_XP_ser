clear all
clc

%% outline
% use rand6000, 5group 2000, ite 8000 to pre and loop add ser into train
% data set.


%% load 

% load trained ANN net data. %%%%%%%%%%%%%%%%%%
tr_rat=1;
tr_rat_str=mat2str(100*tr_rat);
nnt_epochs_en= 8000;
n_add_group=5;
% ANN data
path_ann_train='../res_data/en/en_atom_dis_rand_6000_315ser/';
na_ann_train='Mat_atom_dis_rand6000_315ser_trper100_ite_8000_rep_1_del_0_add_5.mat';

fi_na=[path_ann_train,na_ann_train];
load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');

% md 16,20,41,60 ser. 500 %%%%%%%%%%%%%%%%%%%%%
na_list=[16,20,41,60,1500];

for k=1:length(na_list)
    k;
    % load new random choose ser ANN data. %%%%
    na_ser=mat2str(na_list(k));
    dat_in_pr = load(['../data/ANN_input_out_file_500/',...
        na_ser,'ser/ANN_in_dis.txt']);
    dat_En_pr = load(['../data/ANN_input_out_file_500/',...
        na_ser,'ser/ANN_HF_en_',mat2str(na_list(k)),'ser500.txt']);
    
    % predict En err %%%%%%%%%%%%%%%%%%%%%%%%%%
    [out_si_pr_en_new] = ...
        fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
    
    % store the pre result %%%%%%%%%%%%%%%%%%%%
    na_fi_store=['../res_data/Pre_res_data/rand6000_315ser/Mat_',...
        na_ser,'ser500_ite_',mat2str(nnt_epochs_en),...
        '_del_0_add_',mat2str(n_add_group),'.mat'];
    save(na_fi_store);
    
    re=dat_En_pr;
    si=out_si_pr_en_new;
    ind_err=find((abs(si-re))>0.01);
    
    dlmwrite(['../data/ANN_input_out_file_500/',na_ser,...
              'ser/txt_ind_err.txt'],ind_err, 'precision', '%8d', 'newline', 'Unix')

%     clf
%     h=fun_plot_res_sqr(re,si,['pr ',na_ser]);
%     hold on
%     plot(re(ind_err),si(ind_err),'ro');
%     fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_pr/fig_en_',...
%         na_ser,'pr_congress'];
%     fun_work_li_035_myfig_out(h,fi_na,3);
%     
end



    
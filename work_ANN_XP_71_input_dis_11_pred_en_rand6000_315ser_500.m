clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pre en with trained net
% rand 6000, 3_15Dia 2000 1 group.
% 
% choose one trained net.
% use XP gen new random ser 16,20,41,60, each group choose about 500 ser 
% atom dis as ANN input
% 

 
% md 16,20,41,60 ser. 500 %%%%%%%%%%%%%%%%%%%%%
na_list=[16,20,41,60,1500];
% na_list=[16,41];


%% pre the en . %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:length(na_list)
% for k=3:3
    k;
    % load new random choose ser ANN data. %%%%
    na_ser=mat2str(na_list(k));
    dat_in_pr = load(['../data/ANN_input_out_file_500/',...
        na_ser,'ser/ANN_in_dis.txt']);
    dat_En_pr = load(['../data/ANN_input_out_file_500/',...
        na_ser,'ser/ANN_HF_en_',mat2str(na_list(k)),'ser500.txt']);
    
    for ite=1:1
        ite;
        % load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % load trained ANN net data. %%%%%%%%%%%%%%%%%%
        tr_rat=1;
        tr_rat_str=mat2str(100*tr_rat);
%         nnt_epochs_en= 6500 +  500 * ite;
        nnt_epochs_en= 10500;
        n_add_group=5;
        loadstr=['ite_',mat2str(nnt_epochs_en),'_rep_1_del_0_add_',mat2str(n_add_group)];
        % ANN data 
        
        fi_na=['../res_data/en/en_atom_dis_rand_6000_315ser/Mat_atom_dis_rand6000_315ser_trper',...
                    tr_rat_str,'_',loadstr,'ase.mat'];    
%         tr_rat_str,'_',loadstr,'.mat'];

        load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');
                
        % predict En err %%%%%%%%%%%%%%%%%%%%%%%%%%
        [out_si_pr_en_new] = ...
            fun_ANN_pre_1net_trained(dat_in_tr,dat_En_tr,dat_in_pr,net_tr_en);
        
        % store the pre result %%%%%%%%%%%%%%%%%%%%
        na_fi_store=['../res_data/Pre_res_data/rand6000_315ser/Mat_',...
                         na_ser,'ser500_ite_',mat2str(nnt_epochs_en),...
                               '_del_0_add_',mat2str(n_add_group),'ase.mat'];
        save(na_fi_store);
    end
end

%% plot ANN train result
% % plot range
% plot_rang=[-567.58 -567.535 -567.58  -567.535];
% n_add_group=3;
% epoch_beg=6000;
% n_fin=4;
% for ite=1:n_fin
%     ite;
%     % load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % load trained ANN net data. %%%%%%%%%%%%%%%%%%
%     tr_rat=1;
%     tr_rat_str=mat2str(100*tr_rat);
%     nnt_epochs_en= epoch_beg +  500 * ite;
%     
%     loadstr=['ite_',mat2str(nnt_epochs_en),'_rep_1_del_0_add_',mat2str(n_add_group)];
%     % ANN data    
%     fi_na=['../res_data/en/en_atom_dis_rand_6000_315ser/Mat_atom_dis_rand6000_315ser_trper',...
%         tr_rat_str,'_',loadstr,'.mat'];
%     load(fi_na,'dat_in_tr','dat_En_tr','net_tr_en','out_si_pr_en');
%     
%     re=dat_En_tr;
%     si=out_si_pr_en;
%     
% %     clf
% %     h=fun_plot_res_sqr(re,si,['en tr ','ite ',mat2str(nnt_epochs_en),'add ',mat2str(n_add_group)]);
% %     axis(plot_rang)
% %     fi_na=['../imgs/en/07en_atom_dis_rand_6000_315ser/cong_tr/fig_en_',...
% %         loadstr,'_congress'];
% %     fun_work_li_035_myfig_out(h,fi_na,3);
%      
%     out_mat(:,ite) = fun_static_err_v4(re,si);
%     
% end


%% logs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 10-Dec-2013 09:33:15
% loop to rep each group of ANN.
% mod : 09-Dec-2013 20:50:26
% 
% mod : 09-Dec-2013 19:01:10
% 
% mod : 08-Dec-2013 10:53:06
% the en prediction.


clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this pro is 4 train and predict the ann from heavy atom int cor
% each cluster  relate one ann

%% main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load data ---------------------------------------------------------------
load Mat_cluster_int_halo.mat
% main part ---------------------------------------------------------------
% parameters -----------------------------
n_clu=length(unique(cl));
n_atom=11;

% choose one cluster. --------------------
% for k=1:n_clu
for k=1:1
%     ind_clu=(cl==k); % no halo version
    ind_clu=(halo==k); %    halo version
    dat_clu=a(ind_clu,:);
    dat_clu_En= en(ind_clu,:);
    
    
    
end


% train ann
nnt_epochs_en      = 0.3*10^4;
Er_rat_max         = 0.05;
n_kfold            = 10;

n_con=length(dat_clu);
ind_ori=[1:n_con];
[ind_kf_mat]=fun_Kfold_choose_ind(ind_ori,n_kfold);

% for i=1:n_kfold
for i=1:1
    tm=ind_kf_mat;
    ind_val = tm(i,:);    % validation index
    tm(i,:)=[];
    ind_tra = tm(:)';     % train      index
    
    % choose train data
    dat_in_tr=dat_clu(ind_tra,:);  
    dat_En_tr=dat_clu_En(ind_tra,:);
    
    % choose val index
    dat_in_va=dat_clu(ind_val,:);
    dat_En_va=dat_clu_En(ind_val,:);
    
    % normal input data
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);

    % net parameters
    nnt_goal_en  = 1e-3;    show_NaN      = NaN;     nnt_lr    = 0.2;  nnt_mc = 0.8;

    % gen net
    net_en = fun_gen_nnt(in_tr_01,6*n_atom, 1);
    net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
    net_en.trainParam.showWindow=1;                              % show training

    [out_tr_pr_en,out_va_pr_en,er_tr_en,er_va_en,net_tr_en]=...
        fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_va,dat_En_va,net_en);

end

% store result ------------------------------------------------------------
save Mat_cluster_pred_int_halo.mat
% save Mat_cluster_pred_int.mat  % no halo version

% show result -------------------------------------------------------------
% subplot(1,2,1)
% scatter3(dat_in_tr(:,21),dat_in_tr(:,24),dat_in_tr(:,25),20,dat_En_tr)
% grid on
% axis tight
% subplot(1,2,2)
% scatter3(dat_in_va(:,21),dat_in_va(:,24),dat_in_va(:,25),20,dat_En_va)
% grid on
% axis tight


% scatter3(dat_clu(:,21),dat_clu(:,24),dat_clu(:,25),20,dat_clu_En)
% grid on
% axis tight

%% log %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 27-Aug-2014 09:48:58
% 
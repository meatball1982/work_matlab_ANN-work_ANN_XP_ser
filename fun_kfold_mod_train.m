function [ net_en_out ] = fun_kfold_mod_train(all_data_in,all_data_out,...
                                               add_data_in,add_data_out,...
                                               n_kfold,nnt_epochs_en,er_thred,n_atom)
%% mod k-fold to train ann
% the add data are always in train set

%% main part

% split data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind_ori=[1:length(all_data_in)];
[ind_kf_mat]=fun_Kfold_choose_ind(ind_ori,n_kfold);

n_er=length(ind_ori);

% loop for train net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n_kfold
    % k-fold choose data
    tm=ind_kf_mat;
    ind_val = tm(i,:);    % validation index
    tm(i,:)=[];
    ind_tra = tm(:)';     % train      index
    
    % choose train data
    dat_in_tr = [ all_data_in(ind_tra,:) ; add_data_in  ];
    dat_En_tr = [ all_data_out(ind_tra,:); add_data_out ];

    dat_in_va = all_data_in(ind_val,:) ;  
    dat_En_va = all_data_out(ind_val,:);
    
    % normal input data
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);
    
    % net parameters
    nnt_goal_en  = 1e-5;    show_NaN      = NaN;     nnt_lr    = 0.05;  nnt_mc = 0.9;
    
    % gen net
    net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
    net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
    net_en.trainParam.showWindow=1;                              % show training

    [out_tr_pr_en,out_va_pr_en,er_tr_en,er_va_en,net_tr_en]=...
        fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_va,dat_En_va,net_en);
    
    % find the big err data
    ind_er=abs(out_va_pr_en-dat_En_va)*627.2 > er_thred;
    n_er_tm=sum(ind_er);
    display(['k-fold mod , i=',mat2str(i),' n_er = ',mat2str(n_er_tm)]);
    
    % compare and choose the best split data.
    if n_er_tm < n_er
        n_er             = n_er_tm;            % store er number
        net_en_out       = net_tr_en;          % store the 1round ann
    end

end

end

%% logs
% 21-Mar-2014 15:12:01
% generate the fun.m
function [ Ind_cho, net_trained ] = fun_kfold_train( ...
                                 all_data_in,all_data_out,n_kfold,net_para)
% UNTITLED Summary of this function goes here
% Detailed explanation goes here

%% main part%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% net parameter
nnt_goal   = net_para.nnt_goal  ;    
show_NaN   = net_para.show_NaN  ;
n_net_hid  = net_para.n_net_hid ;
n_net_out  = net_para.n_net_out ;
nnt_lr     = net_para.nnt_lr    ;
nnt_mc     = net_para.nnt_mc    ;
nnt_epoch  = net_para.nnt_epoch ;
nnt_show   = net_para.nnt_show  ;
nnt_goal   = net_para.nnt_goal  ;

% split data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind_ori      = [1:length(all_data_in)];
[ind_kf_mat] = fun_Kfold_choose_ind(ind_ori,n_kfold);

% error thred ------------------------------
er_thred    = sum(abs(all_data_out(:)));

% loop for train net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n_kfold
    % k-fold choose data--------------------
    tm=ind_kf_mat;
    ind_val = tm(i,:);    % validation index
    tm(i,:)=[];
    ind_tra = tm(:)';     % train      index

    % choose train data---------------------
    dat_in_tr  = [ all_data_in(ind_tra,:)  ];
    dat_out_tr = [ all_data_out(ind_tra,:) ];

    % choose valid data---------------------
    dat_in_va  = [ all_data_in(ind_val,:)  ];  
    dat_out_va = [ all_data_out(ind_val,:) ];

    % normal input data---------------------
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);
  
    % gen net ------------------------------
    net_in = fun_gen_nnt(in_tr_01,n_net_hid, n_net_out);
    net_in = fun_par_nnt(net_in,show_NaN,nnt_lr,nnt_mc,nnt_epoch,nnt_goal);
    net_in.trainParam.showWindow=nnt_show;                  % show training

    % train net ----------------------------
    [out_tr_pr,out_va_pr,er_tr,er_va,net_tr]=...
        fun_ANN_pre_1net(dat_in_tr,dat_out_tr,dat_in_va,dat_out_va,net_in);
    
    % update error -------------------------
    er_sum = sum(abs(out_va_pr(:)-dat_out_va(:)));
    
    if er_sum < er_thred
        Ind_cho.tr  = ind_tra;
        Ind_cho.va  = ind_val;
        net_trained = net_tr;
        er_thred    = er_sum;
    end
    
end


% output


end


%% logs

% mod : 
% mod : 29-Apr-2014 09:07:28
% 
% mod : 28-Apr-2014 19:20:21
% 
% mod : 28-Apr-2014 17:15:45
% 

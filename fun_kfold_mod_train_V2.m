function [ Ind_cho, net_trained, er_rat] = fun_kfold_mod_train_V2( ...
                        all_data_in,all_data_out,er_data_in,er_data_out,...
                        n_kfold    ,net_para    ,er_thred  );
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

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

er_rat =1;
% split data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind_ori      = [1:length(all_data_in)];
[ind_kf_mat] = fun_Kfold_choose_ind(ind_ori,n_kfold);

% loop for train net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n_kfold
    % k-fold choose data---------------------
    tm=ind_kf_mat;
    ind_val = tm(i,:);    % validation index
    tm(i,:)=[];
    ind_tra = tm(:)';     % train      index
    
    % choose train data
    dat_in_tr = [ all_data_in(ind_tra,:) ; er_data_in  ];
    dat_out_tr = [ all_data_out(ind_tra,:); er_data_out ];

    dat_in_va = all_data_in(ind_val,:) ;  
    dat_out_va = all_data_out(ind_val,:);
    
    % normal input data
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);

    % gen net ------------------------------
    net_in = fun_gen_nnt(in_tr_01,n_net_hid, n_net_out);
    net_in = fun_par_nnt(net_in,show_NaN,nnt_lr,nnt_mc,nnt_epoch,nnt_goal);
    net_in.trainParam.showWindow=nnt_show;                  % show training

    % train net ----------------------------
    [out_tr_pr,out_va_pr,er_tr,er_va,net_tr]=...
        fun_ANN_pre_1net(dat_in_tr,dat_out_tr,dat_in_va,dat_out_va,net_in);

    % find the big error--------------------
    [ er_rat_tm,ind ] = fun_find_err_big( out_va_pr,dat_out_va,er_thred );
    display(['k-fold mod , i=',mat2str(i),...
             ' er_rat =      ',mat2str(ceil(er_rat_tm*10000)/100),'%']);

%     er_rat_tm
%     % if the er_rat_tm is always ==1. mod : 05-May-2014 20:39:42
%     Ind_cho.tr=0;
%     Ind_cho.va=0;
    % compare and choose the best split data.
    if er_rat_tm <= er_rat
        Ind_cho.tr  = ind_tra;
        Ind_cho.va  = ind_val;
        net_trained = net_tr;
        er_rat      = er_rat_tm;
    end
    
end

end

%% logs
% mod : 29-Apr-2014 17:15:28
% 
clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use 3-20 ser data
% use RBF ann to train the Ann
% predict En 
% if the result is good.
% predict the MD200 ser En(del the error SER).
% else
% use the SVM to predict the MD200 ser En(del the error SER)*

%% main part
% load  trainning data 3-20 ser data
load Mat_320_dis_input_output.mat dat320_En dat320_in

dat320_in=dat320_in([1:20:end],:);
dat320_En=dat320_En([1:20:end],:);

%% parameters predefine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_con320  = length(dat320_En);
n_kfold   = 3 ;

%% use k-fold train net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data ------------------------------------
all_data_in  = dat320_in ;
all_data_out = dat320_En ;

clear dat320_in dat320_En
% split data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind_ori      = [1:length(all_data_in)];
[ind_kf_mat] = fun_Kfold_choose_ind(ind_ori,n_kfold);

% for i=1:n_kfold
% for i=1:1
i=1;
    % k-fold choose data--------------------
    tm=ind_kf_mat;
    ind_val = tm(i,:);    % validation index
    tm(i,:)=[];
    ind_tra = tm(:)';     % train      index
    
clear ind_kf_mat
    % choose train data---------------------
    dat_in_tr  = [ all_data_in(ind_tra,:)  ]';
    dat_out_tr = [ all_data_out(ind_tra,:) ]';

    % choose valid data---------------------
    dat_in_va  = [ all_data_in(ind_val,:)  ]';  
    dat_out_va = [ all_data_out(ind_val,:) ]';

    net_RBF = newrb(dat_in_tr,dat_out_tr,2*10^-5,40,2000,50);
    
% end

save Mat_RBF_kfold_1st_train.mat

% n_kfold

%% logs
% mod : 13-Aug-2014 20:09:17




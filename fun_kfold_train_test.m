clear all
clc


%% outline
% test fun_kfold_train.m
% 


%% main
% data prepairation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load firsrt trainning data 3-20 ser data
load Mat_320_dis_input_output.mat

% load firsrt trainning data 21-60 ser data
load Mat_2160_dis_input_output.mat

all_data_in  = dat320_in ;
all_data_out = dat320_Ch ;
n_kfold      = 3 ;

net_para.nnt_goal   = 0.01;    
net_para.show_NaN   = 1;
net_para.nnt_lr     = 0.05;
net_para.nnt_mc     = 0.9;
net_para.n_net_hid  = 69;
net_para.n_net_out  = 23;

net_para.nnt_epoch  = 5;
net_para.nnt_show   = 1;

[ Ind_choose, net_trained ] = fun_kfold_train( ...
                                all_data_in,all_data_out,n_kfold,net_para);

%% logs
% mod : 28-Apr-2014 19:45:32
% 
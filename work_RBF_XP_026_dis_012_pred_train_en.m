clear all
close all
clc

%% outline
%
% use server to train a RBF ANN .
% test the result

%% main
load Mat_RBF_kfold_1st_train_int10.mat


dat_out_tr_pr=sim(net_RBF,dat_in_tr);
dat_out_va_pr=sim(net_RBF,dat_in_va);
% 
% h=fun_plot_res_sqr(dat_out_tr,dat_out_tr_pr,'RBF pred tr data')
% fi_na='../imgs/en/26en_RBF_dis_cluster_320_intveral_choose/fig01_RBF_pred_tr_data'
% fun_work_li_035_myfig_out(h,fi_na,3)

% hold on
h=fun_plot_res_sqr(dat_out_va,dat_out_va_pr,'RBF pred va data')
fi_na='../imgs/en/26en_RBF_dis_cluster_320_intveral_choose/fig02_RBF_pred_va_data'
fun_work_li_035_myfig_out(h,fi_na,3)

clear all
clc


%% outline
% test fun_Kfold_choose_ind.m
% the input is 

k=5;

ind_ori=[1:52];

[ind_mat]=fun_Kfold_choose_ind(ind_ori,k)

length(unique(ind_mat(:)))
length(ind_mat(:))
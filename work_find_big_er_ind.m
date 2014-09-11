clear all
clc

%% outline 
% find the err big ser

load Mat_find_er_big1.mat ind_er_big
ind1=ind_er_big;
load Mat_find_er_big2.mat ind_er_big
ind2=ind_er_big;

ind_er=intersect(ind1,ind2);

dlmwrite('txt_err_big.txt', ind_er, 'delimiter', '\t')

%% logs
% mod : 19-May-2014 09:33:21
% mod : 17-May-2014 15:21:54
% 
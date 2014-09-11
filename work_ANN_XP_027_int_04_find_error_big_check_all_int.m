clear all
clc

%% outline
% plot the all atom int
% find the out range points

%% load data
load Mat_016_cluster_3_20Dia_int.mat dat_En dat_in 
load Mat_find_err_big_near_ind.mat  ind_tr_320 en_er

% plot index and name
load Mat_int_noh_name.mat

dat_in_nr=dat_in(ind_tr_320,:);
dat_en_nr=dat_En(ind_tr_320);

ind_va_er=dat_En==en_er;
dat_in_va_er=dat_in(ind_va_er,:);

h=plot(dat_in_nr(:,1:22)','bo-')
hold on 
plot(dat_in_va_er(1:22)','ro-')




% plot()

%% logs 
% mod : 11-Sep-2014 20:32:53
% mod : 08-Sep-2014 15:21:01

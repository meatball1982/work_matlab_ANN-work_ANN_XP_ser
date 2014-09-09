clear all
clc

%% outline
% gen the noh atom - atom int  
% draw from 44986 * 63 matrix.
% this m file draw the index


%% load data
load Mat_016_cluster_3_20Dia_int.mat dat_En dat_in 
load Mat_find_err_big_near_ind.mat  ind_tr_320 en_er

dat_in_nr=dat_in(ind_tr_320,:);
dat_en_nr=dat_En(ind_tr_320);

ind_va_er=dat_En==en_er;
dat_in_va_er=dat_in(ind_va_er,:);

plot(dat_in_nr(:,1:22)','bo-')
hold on 
plot(dat_in_va_er(1:22)','ro-')


% plot()

%% logs 
% mod : 08-Sep-2014 15:21:01

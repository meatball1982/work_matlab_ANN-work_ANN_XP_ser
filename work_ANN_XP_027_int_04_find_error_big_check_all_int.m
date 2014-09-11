clear all
clc

%% outline
<<<<<<< HEAD
% plot the all atom int
% find the out range points
=======
% gen the noh atom - atom int  
% draw from 44986 * 63 matrix.
% this m file draw the index
>>>>>>> 1eddd9a6b67a7fab75fd7c92d9bc19766a2b48b6


%% load data
load Mat_016_cluster_3_20Dia_int.mat dat_En dat_in 
load Mat_find_err_big_near_ind.mat  ind_tr_320 en_er
<<<<<<< HEAD
% plot index and name
load Mat_int_noh_name.mat
=======

>>>>>>> 1eddd9a6b67a7fab75fd7c92d9bc19766a2b48b6
dat_in_nr=dat_in(ind_tr_320,:);
dat_en_nr=dat_En(ind_tr_320);

ind_va_er=dat_En==en_er;
dat_in_va_er=dat_in(ind_va_er,:);

<<<<<<< HEAD
h=plot(dat_in_nr(:,1:22)','bo-')
=======
plot(dat_in_nr(:,1:22)','bo-')
>>>>>>> 1eddd9a6b67a7fab75fd7c92d9bc19766a2b48b6
hold on 
plot(dat_in_va_er(1:22)','ro-')


<<<<<<< HEAD


% plot()

%% logs 
% mod : 11-Sep-2014 20:32:53
=======
% plot()

%% logs 
>>>>>>> 1eddd9a6b67a7fab75fd7c92d9bc19766a2b48b6
% mod : 08-Sep-2014 15:21:01

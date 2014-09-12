clear all
clc
clf

%% outline
% plot the all atom int
% find the out range points

%% load data
load Mat_016_cluster_3_20Dia_int.mat dat_En dat_in 
load Mat_find_err_big_near_ind.mat  ind_tr_320 en_er

% plot index and name
load Mat_int_name.mat

n_bod=length(bod_na);
n_ang=length(ang_na);
n_bid=length(dia_na);


dat_in_nr=dat_in(ind_tr_320,:);
dat_en_nr=dat_En(ind_tr_320);

ind_va_er=dat_En==en_er;
dat_in_va_er=dat_in(ind_va_er,:);

% 
h=plot(dat_in_nr(:,1:n_bod)','bo-');
hold on 
plot(dat_in_va_er(1:n_bod)','ro-');
set(gca,'XTick',1:1:n_bod)
set(gca,'XTickLabel',bod_na)
rotateXLabels( gca, -90 )

fi_na=['../imgs/en/27_int_dia_input_en/find_err_big_all_int/fig_feb_all_int_01_bod'];
fun_work_li_035_myfig_out(h,fi_na,3);





%% logs 
% mod : 12-Sep-2014 10:02:00
% mod : 11-Sep-2014 20:32:53
% mod : 08-Sep-2014 15:21:01

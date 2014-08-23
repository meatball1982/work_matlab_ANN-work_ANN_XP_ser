clear all
clc

%% outline
% static ch result

%% main part
load Mat_ch_kfold_static.mat
x_ind=[1:5];
%-----------------------------------------------------------
% plot R
% h=plot(x_ind,Matout_in_pre(:,1),'o-');
% fi_na=[fig_save_path,'/statics/R/fig_static_01_tr_R'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% h=plot(x_ind,Matout_va_pre(:,1),'o-');
% fi_na=[fig_save_path,'/statics/R/fig_static_02_va_R'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% h=plot(x_ind,Matout_2160_pre(:,1),'o-');
% fi_na=[fig_save_path,'/statics/R/fig_static_03_2160_R'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%-----------------------------------------------------------
% plot er rate
h=plot(x_ind,Matout_in_pre(:,4),'o-');
fi_na=[fig_save_path,'/statics/err_rat/fig_static_01_tr_err_rat'];
fun_work_li_035_myfig_out(h,fi_na,3);

h=plot(x_ind,Matout_va_pre(:,4),'o-');
fi_na=[fig_save_path,'/statics/err_rat/fig_static_02_va_err_rat'];
fun_work_li_035_myfig_out(h,fi_na,3);

h=plot(x_ind,Matout_2160_pre(:,4),'o-');
fi_na=[fig_save_path,'/statics/err_rat/fig_static_03_2160_err_rat'];
fun_work_li_035_myfig_out(h,fi_na,3);


%% logs
% 12-May-2014 16:34:41
% 
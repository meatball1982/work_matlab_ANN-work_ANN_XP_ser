clear all
clc

%% outline
% static n84 results

%% main part
load  Mat_n84_kfold_res.mat

x_ind=[1:19];

% ite_con 17 exists err.
x_ind(17)=[];
Matout_in_pre(17,:)=[];
Matout_va_pre(17,:)=[];
Matout_2160_pre(17,:)=[];

% plot(Matout_in_pre(:,1),'.-')

%-----------------------------------------------------------
% plot R
% h=plot(x_ind,Matout_in_pre(:,1),'.-');
% fi_na=[fig_save_path,'/statics/R/fig_static_01_tr_R'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% h=plot(x_ind,Matout_va_pre(:,1),'.-');
% fi_na=[fig_save_path,'/statics/R/fig_static_02_va_R'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% h=plot(x_ind,Matout_2160_pre(:,1),'.-');
% fi_na=[fig_save_path,'/statics/R/fig_static_03_2160_R'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%-----------------------------------------------------------
% plot er rate
% h=plot(x_ind,Matout_in_pre(:,4),'.-');
% fi_na=[fig_save_path,'/statics/err_rat/fig_static_01_tr_err_rat'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% h=plot(x_ind,Matout_va_pre(:,4),'.-');
% fi_na=[fig_save_path,'/statics/err_rat/fig_static_02_va_err_rat'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% h=plot(x_ind,Matout_2160_pre(:,4),'.-');
% fi_na=[fig_save_path,'/statics/err_rat/fig_static_03_2160_err_rat'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% logs
% mod : 24-Apr-2014 09:34:28
% static n84 results
% 


clear all
close all
clc
clf

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the train result result, halo data
% bla bla


%% main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load data ---------------------------------------------------------------
% load Mat_cluster_pred_int.mat
load Mat_cluster_pred_int_halo.mat

% main part ---------------------------------------------------------------

% ind_erbig=abs(dat_En_tr-out_tr_pr_en)>5;
ind_eb_va=abs(dat_En_va-out_va_pr_en)>10;

% store result ------------------------------------------------------------

% show result -------------------------------------------------------------

% mm_ax=[2.8 5.8 2.5 6.2 1 3.8];
mm_ax=[3.5   5.5 4.7 5.7 1.8 3];
% mm_ax=[ 5.08 5.2 5.15 5.3 2.2 2.5 ];
mm_vw=[-10,15];
% mm_vw=[0,90];

% subplot(2,2,1)
h=scatter3(dat_in_tr(:,21),dat_in_tr(:,24),dat_in_tr(:,25),40,dat_En_tr,'fill')
hold on
% plot3(dat_in_tr(ind_erbig,21),dat_in_tr(ind_erbig,24),dat_in_tr(ind_erbig,25),'k.')
% scatter3(dat_in_tr(ind_erbig,21),dat_in_tr(ind_erbig,24),dat_in_tr(ind_erbig,25),....
%     50,dat_En_tr(ind_erbig),'LineWidth',2)

grid on
axis tight
axis(mm_ax)
colorbar
view(mm_vw)
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_data_part'];
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_data'];

fun_work_li_035_myfig_out(h,fi_na,3)
% 
k=caxis;
% 

clf
% subplot(2,2,2)
h=scatter3(dat_in_va(:,21),dat_in_va(:,24),dat_in_va(:,25),40,dat_En_va,'fill');
hold on
scatter3(dat_in_va(ind_eb_va,21),dat_in_va(ind_eb_va,24),dat_in_va(ind_eb_va,25),....
    70,dat_En_va(ind_eb_va),'LineWidth',4)
grid on
axis tight
axis(mm_ax)
colorbar
view(mm_vw)
caxis(k)
fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_va_data'];
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_va_data_part'];
% fun_work_li_035_myfig_out(h,fi_na,3)

% clf
% subplot(2,2,2)
% h=scatter3(dat_in_tr(:,21),dat_in_tr(:,24),dat_in_tr(:,25),20,dat_En_tr);
% hold on
% % plot3(dat_in_tr(ind_erbig,21),dat_in_tr(ind_erbig,24),dat_in_tr(ind_erbig,25),'k.')
% scatter3(dat_in_tr(ind_erbig,21),dat_in_tr(ind_erbig,24),dat_in_tr(ind_erbig,25),....
%     50,dat_En_tr(ind_erbig),'LineWidth',2)
% 
% grid on
% axis tight
% axis(mm_ax)
% colorbar
% view(mm_vw)
% % fi_na=['../imgs/en/27_int_dia_input_en/result_ann/fig_FP_res_ann_tr_data_er'];
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann/fig_FP_res_ann_tr_data_er_rot'];
% % fun_work_li_035_myfig_out(h,fi_na,3)
% 
k=caxis;


% % clf
% subplot(2,2,2)
% h=scatter3(dat_in_va(:,21),dat_in_va(:,24),dat_in_va(:,25),20,dat_En_va)
% grid on
% axis tight
% axis(mm_ax)
% caxis(k)
% colorbar
% view(mm_vw)
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann/fig_FP_res_ann_va_data'];
% fun_work_li_035_myfig_out(h,fi_na,3)


% scatter3(dat_clu(:,21),dat_clu(:,24),dat_clu(:,25),20,dat_clu_En)
% grid on
% axis tight



% subplot(2,2,3)
% h=fun_plot_res_sqr(dat_En_tr,out_tr_pr_en,'tr')
% hold on
% plot(dat_En_tr,dat_En_tr+3,'r.')
% plot(dat_En_tr,dat_En_tr-3,'r.')
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_regress_halo'];
% fun_work_li_035_myfig_out(h,fi_na,3)
% 
% clf
% % subplot(2,2,4)
% h=fun_plot_res_sqr(dat_En_va,out_va_pr_en,'va')
% hold on
% plot(dat_En_va,dat_En_va+3,'r.')
% plot(dat_En_va,dat_En_va-3,'r.')
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_va_regress_halo'];
% fun_work_li_035_myfig_out(h,fi_na,3)

%% log %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 28-Aug-2014 09:11:07
% 
% mod : 27-Aug-2014 15:10:12
% 
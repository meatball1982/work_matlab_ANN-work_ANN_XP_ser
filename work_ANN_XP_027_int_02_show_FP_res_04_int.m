clear all
clc
clf

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the train result result
% bla bla


%% main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load data ---------------------------------------------------------------
% load Mat_cluster_pred_int.mat
load Mat_cluster_pred_int_halo.mat

% main part ---------------------------------------------------------------

% ind_erbig=abs(dat_En_tr-out_tr_pr_en)>5;
ind_eb_va=abs(dat_En_va-out_va_pr_en)>5;

% store result ------------------------------------------------------------

% show result -------------------------------------------------------------

% mm_ax=[2.8 5.8 2.5 6.2 1 3.8];
% mm_ax=[3   5.8 4.5 6 1 3.8];
% mm_ax=[ 5.1 5.15 5. 5.4 1.8 3.2 ];
% mm_vw=[-50,15];
mm_vw=[0,90];

% % subplot(2,2,1)
% % h=scatter3(dat_in_tr(:,21),dat_in_tr(:,24),dat_in_tr(:,25),20,dat_En_tr)
% % hold on
% % % plot3(dat_in_tr(ind_erbig,21),dat_in_tr(ind_erbig,24),dat_in_tr(ind_erbig,25),'k.')
% % % scatter3(dat_in_tr(ind_erbig,21),dat_in_tr(ind_erbig,24),dat_in_tr(ind_erbig,25),....
% % %     50,dat_En_tr(ind_erbig),'LineWidth',2)
% % 
% % grid on
% % axis tight
% % axis(mm_ax)
% % colorbar
% % view(mm_vw)
% % % % fi_na=['../imgs/en/27_int_dia_input_en/result_ann/fig_FP_res_ann_tr_data'];
% % % % fun_work_li_035_myfig_out(h,fi_na,3)
% % % 
% % % k=caxis;
% % % 
% % 
% % % clf
% % subplot(2,2,2)
% % h=scatter3(dat_in_va(:,21),dat_in_va(:,24),dat_in_va(:,25),20,dat_En_va);
% % hold on
% % scatter3(dat_in_va(ind_eb_va,21),dat_in_va(ind_eb_va,24),dat_in_va(ind_eb_va,25),....
% %     50,dat_En_va(ind_eb_va),'LineWidth',2)
% % grid on
% % axis tight
% % axis(mm_ax)
% % colorbar
% % view(mm_vw)

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
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann/fig_FP_res_ann_tr_regress_halo'];
% fun_work_li_035_myfig_out(h,fi_na,3)
% 
% clf
% % subplot(2,2,4)
% h=fun_plot_res_sqr(dat_En_va,out_va_pr_en,'va')
% hold on
% plot(dat_En_va,dat_En_va+3,'r.')
% plot(dat_En_va,dat_En_va-3,'r.')
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann/fig_FP_res_ann_va_regress_halo'];
% fun_work_li_035_myfig_out(h,fi_na,3)

%% log %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 27-Aug-2014 15:10:12
% 
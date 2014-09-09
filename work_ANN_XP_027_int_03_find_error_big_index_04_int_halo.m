clear all
clc
clf

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this pro is to find the error big ser index 
% the ser near the error big ser.
% compare them, the xyz cord and int cord


%% main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mm_vw=[5 5.2 5.2 5.3 2.2 2.6]
% load data ---------------------------------------------------------------
load Mat_cluster_pred_int_halo.mat
% main part ---------------------------------------------------------------
ind_eb_va=abs(dat_En_va-out_va_pr_en)>10;

% store result ------------------------------------------------------------
% show result -------------------------------------------------------------
% h=scatter3(dat_in_va(:,21),dat_in_va(:,24),dat_in_va(:,25),30,dat_En_va);
% hold on
% % scatter3(dat_in_va(ind_eb_va,21),dat_in_va(ind_eb_va,24),dat_in_va(ind_eb_va,25),....
% %     30,dat_En_va(ind_eb_va),'LineWidth',4)
% axis tight
% colorbar

ind_01    = dat_in_va(:,21)>5   & dat_in_va(:,21)<5.2;
ind_02    = dat_in_va(:,24)>5.2 & dat_in_va(:,24)<5.25;
ind_03    = dat_in_va(:,25)>2.3 & dat_in_va(:,25)<2.5;
ind_er    = ind_eb_va & ind_01 & ind_02 & ind_03;

ind_01_nr = dat_in_tr(:,21)>5   & dat_in_tr(:,21)<5.2;
ind_02_nr = dat_in_tr(:,24)>5.2 & dat_in_tr(:,24)<5.25;
ind_03_nr = dat_in_tr(:,25)>2.3 & dat_in_tr(:,25)<2.5;
ind_nr    = ind_01_nr & ind_02_nr & ind_03_nr;

sum(ind_er)
sum(ind_nr)

c=dat320_in_noh;
b=c(:,end-6:end);
b(b<0)=b(b<0)+2*pi;
ind_b3=b(:,3)<1.2;
b(ind_b3,3)=b(ind_b3,3)+2*pi;
ind_b6=b(:,6)>4.5;
b(ind_b6,6)=b(ind_b6,6)-2*pi;

c(:,end-6:end)=b;

clear ind_0* ind_b* b

% find the index of error big point
% for i=1:length(c)
%     if abs(sum(dat_in_va(ind_er,:)-c(i,:)))==0
%         i
%     end
% end

d=dat_in_tr(ind_nr,:);          % data input train around err big
d_er=dat_in_va(ind_er,:);       % data input va 
en_er=dat_En_va(ind_er);        % er big ser energy
en_er_pr=out_va_pr_en(ind_er);  % er big ser energy predicted

dat_En_tr(ind_nr)

ind_tr_320=[];

for i=1:length(c)
    for j=1:length(d(:,1))
        if abs(sum(c(i,:)-d(j,:)))==0
%             i
            ind_tr_320=[ind_tr_320;i];
        end
    end
end

save Mat_find_err_big_near_ind.mat ind_tr_320 en_er


% h=stem3(dat_in_tr(ind_nr,21),dat_in_tr(ind_nr,24),dat_En_tr(ind_nr),'o',...
% 'LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','g','MarkerSize',10)
% hold on
% 
% stem3(dat_in_va(ind_er,21),dat_in_va(ind_er,24),dat_En_va(ind_er),'o',...
% 'LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
% 
% axis tight
% box on
% grid on
% xlabel('int 21')
% ylabel('int 24')
% zlabel('energy')
% view(-20,10)
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_va_output'];
% fun_work_li_035_myfig_out(h,fi_na,3)



% tr_er_in=c(ind_tr_320,:);
% va_er_in=d_er;
% 
% 
% h=plot(tr_er_in','b.-')
% hold on
% plot(va_er_in,'r.-')
% legend('tr 01','tr 02','tr 03','tr 04','tr 05','tr 06','tr 07','tr 08','tr 09','er big',2)
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_va_input'];
% fun_work_li_035_myfig_out(h,fi_na,3)

% % axis([16 18 1.8 2.1])
% % fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_va_input_17'];
% % fun_work_li_035_myfig_out(h,fi_na,3)
% 
% % axis([19.5 20.5 2.7 3.3])
% % fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_tr_va_input_20'];
% % fun_work_li_035_myfig_out(h,fi_na,3)
% 

% % plot3(dat_in_va(ind_er,21),dat_in_va(ind_er,24),dat_in_va(ind_er,25),'*','MarkerSize',20)
% hold on
% scatter3(dat_in_va(ind_er,21),dat_in_va(ind_er,24),dat_in_va(ind_er,25),80,dat_En_va(ind_er),'fill')
% 
% % plot3(dat_in_tr(ind_nr,21),dat_in_tr(ind_nr,24),dat_in_tr(ind_nr,25),'s','MarkerSize',30)
% scatter3(dat_in_tr(ind_nr,21),dat_in_tr(ind_nr,24),dat_in_tr(ind_nr,25),50,dat_En_tr(ind_nr),'fill');
% 
% % view(0,90)
% % axis(mm_vw)
% % fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_va_data_er090'];
% % fun_work_li_035_myfig_out(h,fi_na,3)
% 
% view(90,0)
% axis(mm_vw)
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_va_data_er900'];
% % fun_work_li_035_myfig_out(h,fi_na,3)


% view(0,0)
% axis(mm_vw)
% fi_na=['../imgs/en/27_int_dia_input_en/result_ann_halo/fig_FP_res_ann_va_data_er00'];
% fun_work_li_035_myfig_out(h,fi_na,3)




%% log %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 08-Sep-2014 09:49:45
% mod : 30-Aug-2014 08:49:09
% mod :28-Aug-2014 16:34:23
% 
% 


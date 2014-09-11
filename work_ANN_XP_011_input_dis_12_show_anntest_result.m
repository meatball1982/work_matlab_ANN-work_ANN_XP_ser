clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

load Mat_en_XP_anntest.mat

re=dat_En_pr;
si=out_si_pr_en_new;

ind=find(abs(si-re)>0.01);

h=fun_plot_res_sqr(re,si,['pr 17-60 rand 10000']);
hold on
plot(re(ind),si(ind),'ro')
% fi_na=['../imgs/en/10en_atom_dis_anntest/cong_pr/fig_en_17_60Dia_pr_congress'];
% fun_work_li_035_myfig_out(h,fi_na,3); 



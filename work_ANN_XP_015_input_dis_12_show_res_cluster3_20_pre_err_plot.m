clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 

load Mat_en_XP_anntest_cluster3_20.mat

ite=10000;
re=dat_En_pr;
si=out_si_pr_en_new;

ind=find(abs(si-re)>0.01);

mat_en_stat(:,1)=fun_static_err_v4(dat_En_tr,out_si_pr_en);
mat_en_stat(:,2)=fun_static_err_v4(re,si);

clf
h=fun_plot_res_sqr(dat_En_tr,out_si_pr_en,['tr cluster 3-20Dia er tr']);
fi_na=['../imgs/en/14en_atom_dis_cluster/cong_tr/fig_en_cluster3_20_tr_congress_ite_',mat2str(ite)];
fun_work_li_035_myfig_out(h,fi_na,3);

clf
h=fun_plot_res_sqr(re,si,['pr cluster 3-20Dia er ']);
hold on
plot(re(ind),si(ind),'ro')
fi_na=['../imgs/en/14en_atom_dis_cluster/cong_pr/fig_en_cluster3_20_pr_congress_ite_',mat2str(ite)];
fun_work_li_035_myfig_out(h,fi_na,3); 


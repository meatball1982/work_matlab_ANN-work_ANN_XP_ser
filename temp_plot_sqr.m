clear all
clc

load Mat_temp_2_test_en_1net.mat

plot_rang=[-569.59 -569.55 -569.59 -569.55];
subplot(1,2,1)
re=dat_En_tr;
si=out_tr_pr_en;
h=fun_plot_res_sqr(re,si,'en tr');
axis(plot_rang)
subplot(1,2,2)
re=dat_En_si;
si=out_si_pr_en;
h=fun_plot_res_sqr(re,si,'en si');
axis(plot_rang)
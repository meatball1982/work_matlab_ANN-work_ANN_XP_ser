clear all
clc


%% plot the En ser draw from pot
% dat_En_pr   = load('../data/ANN_input_out_file_pot/EuHF_ANN_pot');
% h=plot(dat_En_pr,'.');
% fi_na=['../imgs/en/05en_atom_dis_pot/orig_data/fig_en_ser_pot'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% plot the err ANN predict
% load Mat_en_XP_pot_err.mat
% h=fun_plot_res_sqr(dat_En_pr,out_si_pr_en_new,'en pr pot');
% axis([-567.585 -567.45 -567.585 -567.20])
% fi_na=['../imgs/en/05en_atom_dis_pot/prediction/fig_en_cong_err'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% plot the ANN predict with out err 
% load Mat_en_XP_pot_without_err.mat
% h=fun_plot_res_sqr(dat_En_pr(ind),out_si_pr_en_new,'en pr pot');
% axis([-567.58 -567.53 -567.58 -567.53])
% fi_na=['../imgs/en/05en_atom_dis_pot/prediction/fig_en_cong_without_err'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% plot the ANN predict with rand 6000 +5 group 2000 rand
load Mat_en_XP_pot_err_16000.mat
h=fun_plot_res_sqr(dat_En_pr(ind),out_si_pr_en_new,'en pr pot');

axis_range=[-567.58 -567.53 -567.58 -567.53]
axis(axis_range);
fi_na=['../imgs/en/05en_atom_dis_pot/prediction/fig_en_cong_without_err_16000_insquare'];
fun_work_li_035_myfig_out(h,fi_na,3);

% axis_range=[-567.58 -567.53 -567.58 -567.3]
% axis(axis_range);
% fi_na=['../imgs/en/05en_atom_dis_pot/prediction/fig_en_cong_without_err_16000'];
% fun_work_li_035_myfig_out(h,fi_na,3);

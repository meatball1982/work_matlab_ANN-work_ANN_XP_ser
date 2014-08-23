clear all
clc

%% outline
% output the loop train net results

%% main part
% n116 cal 
path_ann_train='../res_data/en/en_atom_dis_cluster_320_loop_pre_2160/n116/';
% na_ann_train='Mat_loop_320_pre_2160_0_200000.mat';
na_ann_train='Mat_loop_320_pre_2160_1_205000.mat';
% na_ann_train='Mat_loop_320_pre_2160_2_210000.mat';


fi_na=[path_ann_train,na_ann_train];
load(fi_na)

% clf
% h=fun_plot_res_sqr(dat_En_tr,out_tr_pr_en,['tr']);
% fi_na=['../imgs/en/21en_atom_dis_cluster_320_loop_pre_2160/n116/loop_320_pre_2160_0_200000_tr'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% clf
% h=fun_plot_res_sqr(dat_En_va,out_va_pr_en,['va']);
% fi_na=['../imgs/en/21en_atom_dis_cluster_320_loop_pre_2160/n116/loop_320_pre_2160_0_200000_va'];
% fun_work_li_035_myfig_out(h,fi_na,3);

clf
h=fun_plot_res_sqr(dat_En_tr,out_tr_pr_en,['tr']);
fi_na=['../imgs/en/21en_atom_dis_cluster_320_loop_pre_2160/n116/loop_320_pre_2160_1_205000_tr'];
fun_work_li_035_myfig_out(h,fi_na,3);
clf
h=fun_plot_res_sqr(dat_En_va,dat_En_va_pre,['va'])
fi_na=['../imgs/en/21en_atom_dis_cluster_320_loop_pre_2160/n116/loop_320_pre_2160_1_205000_va'];
fun_work_li_035_myfig_out(h,fi_na,3);

% clf
% h=fun_plot_res_sqr(dat_En_tr,out_tr_pr_en,['tr']);
% fi_na=['../imgs/en/21en_atom_dis_cluster_320_loop_pre_2160/n116/loop_320_pre_2160_2_210000_tr'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% clf
% h=fun_plot_res_sqr(dat_En_va,dat_En_va_pre,['va'])
% fi_na=['../imgs/en/21en_atom_dis_cluster_320_loop_pre_2160/n116/loop_320_pre_2160_2_210000_va'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% logs
% mod : 17-Mar-2014 10:04:27

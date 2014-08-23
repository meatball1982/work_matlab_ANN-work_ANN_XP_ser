clear all
clc

%% outline %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot and static the pre result by the 6000ser with 8500ite ANN
% pre 16,20,41,60 ser, 500 result.

%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % md 16,20,41,60 ser. 500 %%%%%%%%%%%%%%%%%%%%%
% na_list=[16,20,41,60];
% % na_list=[16,41];
% 
% for i=1:length(na_list)
%     % load the pre result %%%%%%%%%%%%%%%%%%%%
%     na_ser=mat2str(na_list(i));
%     na_fi_store=['../res_data/Pre_res_data/Mat_',na_ser,'ser500.mat'];
%     load(na_fi_store);
%     
%     % static pr %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     re=dat_En_pr;
%     pr=out_si_pr_en_new;
%     mat_en_stat_pr(:,i)=fun_static_err_v4(re,pr);
%    
%     % plot si congress %%%%%%%%%%%%%%%%%%%%%%%
%     clf
%     h=fun_plot_res_sqr(re,pr,['en pr',na_ser,' ser500']);
%     fi_na=['../imgs/en/06en_atom_dis_500ser/fig_en_',na_ser,'_congress'];
%     fun_work_li_035_myfig_out(h,fi_na,3); 
%     
%     % plot si congress in range %%%%%%%%%%%%%%
%     clf
%     h=fun_plot_res_sqr(re,pr,['en pr',na_ser,' ser500 in range']);
%     axis([-567.58 -567.54 -567.58 -567.54])
%     fi_na=['../imgs/en/06en_atom_dis_500ser/fig_en_',na_ser,'_congress_inrange'];
%     fun_work_li_035_myfig_out(h,fi_na,3); 
% 
% end


%% 
na_fi_store=['../res_data/Pre_res_data/Mat_20ser500.mat'];
load(na_fi_store);

re=dat_En_pr;
pr=out_si_pr_en_new;

er_ind=find((pr-re)>0.03);
clf

h=fun_plot_res_sqr(re,pr,['en pr',na_ser,' ser500 er> 0.01']);
hold on
plot(re(er_ind),pr(er_ind),'ro')
% fi_na=['../imgs/en/06en_atom_dis_500ser/fig_en_20_congress_error'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% logs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod : 08-Dec-2013 11:10:57

clear all
clc

%% outline
% show ch,en,fs result

nnt_epochs_en = 2000; 
fi_na=['../res_data/en/en_dif_intmax_bigint/Mat_dif_intmax_',...
                                     mat2str(nnt_epochs_en),'_bigint.mat'];
load(fi_na);        % load data

%% en  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:20
% % for i=1:2
%     % max iterative 
%     nnt_epochs_en = 1000+i*1000; 
%     fi_na=['../res_data/en/en_dif_intmax_bigint/Mat_dif_intmax_',...
%                                      mat2str(nnt_epochs_en),'_bigint.mat'];
%     load(fi_na);        % load data
%     
%     % static tr 
%     re=dat_En_tr;
%     si=out_tr_pr_en;
%     mat_en_stat_tr(:,i)=fun_static_err_v4(re,si);
%     
%     % plot tr congress
%     clf
%     h=fun_plot_res_sqr(re,si,'en tr');
%     fi_na=['../imgs/en/cong_tr/fig_en_',mat2str(nnt_epochs_en),'_congress'];
%     fun_work_li_035_myfig_out(h,fi_na,3);
%     
%     % static si
%     re=dat_En_si;
%     si=out_si_pr_en;
%     mat_en_stat_si(:,i)=fun_static_err_v4(re,si);
%     
%     % plot si congress
%     clf
%     h=fun_plot_res_sqr(re,si,'en si');
%     fi_na=['../imgs/en/cong_si/fig_en_',mat2str(nnt_epochs_en),'_congress'];
%     fun_work_li_035_myfig_out(h,fi_na,3); 
%     
% end

%% ch  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:20
% % for i=1:2
%     % max iterative 
%     nnt_epochs_ch = 1000+i*1000; 
%     fi_na=['../res_data/ch/ch_dif_intmax_bigint/Mat_dif_intmax_',...
%                                      mat2str(nnt_epochs_ch),'_bigint.mat'];
%     load(fi_na);        % load data
%     
%     % static tr 
%     re=dat_Ch_mull_tr(:);
%     si=out_tr_pr_ch_mull(:);
%     mat_ch_stat_tr(:,i)=fun_static_err_v4(re,si);
%     
%     % plot tr congress
% %     clf
% %     h=fun_plot_res_sqr(re,si,'ch tr');
% %     fi_na=['../imgs/ch/cong_tr/fig_ch_mull_',mat2str(nnt_epochs_ch),'_congress'];
% %     fun_work_li_035_myfig_out(h,fi_na,3);
%     
%     % static si
%     re=dat_Ch_mull_si(:);
%     si=out_si_pr_ch_mull(:);
%     mat_ch_stat_si(:,i)=fun_static_err_v4(re,si);
%     
%     % plot si congress
% %     clf
% %     h=fun_plot_res_sqr(re,si,'ch si');
% %     fi_na=['../imgs/ch/cong_si/fig_ch_mull_',mat2str(nnt_epochs_ch),'_congress'];
% %     fun_work_li_035_myfig_out(h,fi_na,3); 
%     
% end

%% fs  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for k=1:20
% % for k=1:2
%     % max iterative 
%     nnt_epochs_fs = 1000+k*1000; 
%     fi_na=['../res_data/fs/fs_dif_intmax_bigint/Mat_dif_intmax_',...
%                                      mat2str(nnt_epochs_fs),'_bigint.mat'];
%     load(fi_na);        % load data
%     
%     % static tr 
%     re=dat_Fs_tr(:);
%     si=out_tr_pr_fs(:);
%     mat_fs_stat_tr(:,k)=fun_static_err_v4(re,si);
%     
%     % plot tr congress
% %     clf
% %     h=fun_plot_res_sqr(re,si,'fs tr');
% %     fi_na=['../imgs/fs/cong_tr/fig_fs_',mat2str(nnt_epochs_fs),'_congress'];
% %     fun_work_li_035_myfig_out(h,fi_na,3);
%     
%     % static si
%     re=dat_Fs_si(:);
%     si=out_si_pr_fs(:);
%     mat_fs_stat_si(:,k)=fun_static_err_v4(re,si);
%     
%     % plot si congress
% %     clf
% %     h=fun_plot_res_sqr(re,si,'fs si');
% %     fi_na=['../imgs/fs/cong_si/fig_fs_',mat2str(nnt_epochs_fs),'_congress'];
% %     fun_work_li_035_myfig_out(h,fi_na,3); 
%     
% end


%% logs
% mod : 2013年 11月 26日 星期二 16:40:31 CST
% mod : 26-Nov-2013 14:04:10
% 
% mod : 20-Nov-2013 10:31:37
% 

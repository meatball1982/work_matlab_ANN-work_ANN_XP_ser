clear all
clc

%% outline
% show en and ch result
% 
% use XP ser to train ANN
% random choose the ser.
% 6000 ser


%% en  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clf
% k=3;
% 
% tr_rat=0.2+0.05*8;
% tr_rat_str=mat2str(100*tr_rat);
% i=1;
% nnt_epochs_en=3000;
% 
% fi_na=['../res_data/en/en_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
%       tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
% 
%                                  
% load(fi_na);
% plot_rang=[-567.58 -567.535 -567.58  -567.535];
% subplot(1,2,1)
% re=dat_En_tr;
% si=out_tr_pr_en;
% h=fun_plot_res_sqr(re,si,'en tr');
% axis(plot_rang)
% subplot(1,2,2)
% re=dat_En_si;
% si=out_si_pr_en;
% h=fun_plot_res_sqr(re,si,'en si');
% axis(plot_rang)


% n_per=8;
% n_rep=5;
% n_ite=4;
% 
% 
% % n_per=2;
% % n_rep=1;
% % n_ite=2;
% 
% plot_rang=[-567.58 -567.535 -567.58  -567.535];
% 
% % for k=1:n_per
% for k=14:14
% 
% tr_rat=0.2+0.05*k;
% tr_rat_str=mat2str(100*tr_rat);
% 
% for i=1:n_rep
%     for ite=1:n_ite
%     nnt_epochs_en = 1000+ite*1000;
%     i_store=(k-1)*10+ite;
%     fi_na=['../res_data/en/en_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
%       tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
% 
%     load(fi_na,'dat_En_tr','out_tr_pr_en','dat_En_si','out_si_pr_en');        % load data
%     
%     % static tr 
%     re=dat_En_tr;
%     si=out_tr_pr_en;
%     mat_en_stat_tr(:,i_store)=fun_static_err_v4(re,si);
%     
%     % plot tr congress
%     clf
%     h=fun_plot_res_sqr(re,si,['en tr atom dis ',tr_rat_str,...
%                          ' ite',mat2str(nnt_epochs_en),' rep',mat2str(i)]);
%     axis(plot_rang)
%     fi_na=['../imgs/en/04en_atom_dis_rand_6000/cong_tr/fig_en',...
%         '_per_',tr_rat_str,...
%         '_ite_',mat2str(nnt_epochs_en),...
%         '_rep_',mat2str(i),...
%         '_congress'];
%     fun_work_li_035_myfig_out(h,fi_na,3);
%     
%     % static si
%     re=dat_En_si;
%     si=out_si_pr_en;
%     mat_en_stat_si(:,i_store)=fun_static_err_v4(re,si);
%     
%     % plot si congress
%     clf
%     h=fun_plot_res_sqr(re,si,['en si atom dis ',tr_rat_str,...
%                          ' ite',mat2str(nnt_epochs_en),' rep',mat2str(i)]);
%     axis(plot_rang)
%     fi_na=['../imgs/en/04en_atom_dis_rand_6000/cong_si/fig_en',...
%         '_per_',tr_rat_str,...
%         '_ite_',mat2str(nnt_epochs_en),...
%         '_rep_',mat2str(i),...
%         '_congress'];
%     
%     fun_work_li_035_myfig_out(h,fi_na,3); 
% 
% 
% end    
% end
% end

% plot 100% of 6000 ser to pre en %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n_per=16;
% n_rep=1;
% n_ite=20;
% 
% plot_rang=[-567.58 -567.535 -567.58  -567.535];
% 
% % for k=1:n_per
% for k=n_per:n_per
% 
% tr_rat=0.2+0.05*k;
% tr_rat_str=mat2str(100*tr_rat);
% 
% for i=1:n_rep
%     for ite=1:n_ite
%     nnt_epochs_en = 500+ite*500;
%     i_store=(k-1)*10+ite;
%     fi_na=['../res_data/en/en_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
%       tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
% 
%     load(fi_na,'dat_En_tr','out_tr_pr_en','dat_En_si','out_si_pr_en');        % load data
%     
%     % static tr 
%     re=dat_En_tr;
%     si=out_tr_pr_en;
%     mat_en_stat_tr(:,i_store)=fun_static_err_v4(re,si);
%     
%     % plot tr congress
%     clf
%     h=fun_plot_res_sqr(re,si,['en tr atom dis ',tr_rat_str,...
%                          ' ite',mat2str(nnt_epochs_en),' rep',mat2str(i)]);
%     axis(plot_rang)
%     fi_na=['../imgs/en/04en_atom_dis_rand_6000/cong_tr/fig_en',...
%         '_per_',tr_rat_str,...
%         '_ite_',mat2str(nnt_epochs_en),...
%         '_rep_',mat2str(i),...
%         '_congress'];
%     fun_work_li_035_myfig_out(h,fi_na,3);
%     
%     % static si
%     re=dat_En_si;
%     si=out_si_pr_en;
%     mat_en_stat_si(:,i_store)=fun_static_err_v4(re,si);
%     
%     % plot si congress
%     clf
%     h=fun_plot_res_sqr(re,si,['en si atom dis ',tr_rat_str,...
%                          ' ite',mat2str(nnt_epochs_en),' rep',mat2str(i)]);
%     axis(plot_rang)
%     fi_na=['../imgs/en/04en_atom_dis_rand_6000/cong_si/fig_en',...
%         '_per_',tr_rat_str,...
%         '_ite_',mat2str(nnt_epochs_en),...
%         '_rep_',mat2str(i),...
%         '_congress'];
%     
%     fun_work_li_035_myfig_out(h,fi_na,3); 
% 
% 
% end    
% end
% end



%% ch
% load one ch mat. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('../res_data/ch/ch_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper25_ite_1500_rep_1.mat')
% 
% re=dat_Ch_mu_si(:);
% si=out_si_pr_ch_mull(:);
% mat_en_stat_si(:,1)=fun_static_err_v4(re,si);
% 
% % plot si congress
% clf
% subplot(1,2,1)
% h=fun_plot_res_sqr(re,si,['ch si atom dis ',tr_rat_str,...
%     ' ite',mat2str(nnt_epochs_ch),' rep',mat2str(i)]);
% % axis(plot_rang)
% 
% re=dat_Ch_mu_tr(:);
% si=out_tr_pr_ch_mull(:);
% mat_en_stat_si(:,1)=fun_static_err_v4(re,si);
% 
% % plot si congress
% % clf
% subplot(1,2,2)
% h=fun_plot_res_sqr(re,si,['ch tr atom dis ',tr_rat_str,...
%     ' ite',mat2str(nnt_epochs_ch),' rep',mat2str(i)]);

% plot multi group ch %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n_per=14;
% n_rep=5;
% n_ite=10;

n_per=3;
n_rep=1;
n_ite=10;

plot_rang=[-0.9 0.9 -0.9 0.9 ];
cho_int=5;

% for k=1:n_per
for k=9:9
    
tr_rat=0.2+0.05*k;
tr_rat_str=mat2str(100*tr_rat);

for i=1:n_rep

    for ite=1:n_ite
        nnt_epochs_ch = 1000+ite*500;
        fi_na=['../res_data/ch/ch_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
            tr_rat_str,'_ite_',mat2str(nnt_epochs_ch),'_rep_',mat2str(i),'.mat'];
        load(fi_na,'dat_Ch_mu_tr','dat_Ch_mu_si','out_tr_pr_ch_mull','out_si_pr_ch_mull');

        i_store=(k-1)*10+ite;
        re=dat_Ch_mu_tr(:);
        si=out_tr_pr_ch_mull(:);
        mat_en_stat_si(:,i_store)=fun_static_err_v4(re,si);
        
        % plot si congress
        clf
        h=fun_plot_res_sqr(re(1:cho_int:end),si(1:cho_int:end),...
            ['ch tr atom dis ',tr_rat_str,...
            ' ite',mat2str(nnt_epochs_ch),' rep',mat2str(i)]);
        axis(plot_rang)
        fi_na=['../imgs/ch/04ch_atom_dis_rand_6000/cong_tr/fig_ch',...
            '_per_',tr_rat_str,...
            '_ite_',mat2str(nnt_epochs_ch),...
            '_rep_',mat2str(i),...
            '_congress'];
        fun_work_li_035_myfig_out(h,fi_na,3);
        
 
        re=dat_Ch_mu_si(:);
        si=out_si_pr_ch_mull(:);
        mat_en_stat_si(:,i_store)=fun_static_err_v4(re,si);
        
        % plot si congress
        clf
        h=fun_plot_res_sqr(re(1:cho_int:end),si(1:cho_int:end),...
            ['ch si atom dis ',tr_rat_str,...
            ' ite',mat2str(nnt_epochs_ch),' rep',mat2str(i)]);
        axis(plot_rang)
        fi_na=['../imgs/ch/04ch_atom_dis_rand_6000/cong_si/fig_ch',...
            '_per_',tr_rat_str,...
            '_ite_',mat2str(nnt_epochs_ch),...
            '_rep_',mat2str(i),...
            '_congress'];
        fun_work_li_035_myfig_out(h,fi_na,3);

    end
end
end


%% logs
% mod : 07-Dec-2013 09:29:04
% plot 100% per en train.
% 
% mod : 06-Dec-2013 21:42:12
% 
% mod : 06-Dec-2013 15:21:11
% plot 65 per
% 
% mod : 02-Dec-2013 10:34:53
% mod : 30-Nov-2013 14:34:17
% mod : 28-Nov-2013 10:11:39
% show result of atom dis as ANN input.
%
% mod : 2013年 11月 26日 星期二 16:40:31 CST
% mod : 26-Nov-2013 14:04:10
% 
% mod : 20-Nov-2013 10:31:37
% 

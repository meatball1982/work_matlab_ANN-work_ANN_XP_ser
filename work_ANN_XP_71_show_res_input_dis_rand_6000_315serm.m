clear all
clc

%% outline
% show en and ch result
% 
% use XP ser to train ANN
% random choose the ser.
% 6000 ser + 315 Dia 


%% en  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clf
% k=3;
% tr_rat=1;
% tr_rat_str=mat2str(100*tr_rat);
% i=1;
% % nnt_epochs_en=7000;
% 
% % fi_na=['../res_data/Pre_res_data/rand6000_315ser/Mat_20ser500.mat'];
% fi_na=['../res_data/Pre_res_data/rand6000_315ser/Mat_1500ser500_ite_8500_del_0_add_5.mat'];
% 
% load(fi_na);
% plot_rang=[-567.58 -567.535 -567.58  -567.535];
% 
% re=dat_En_pr;
% si=out_si_pr_en_new;
% h=fun_plot_res_sqr(re,si,'en si ');
% % axis(plot_rang)

na_list=[16,20,41,60,1500];

for k=1:length(na_list)
    k;
    % load new random choose ser ANN data. %%%%
    na_ser=mat2str(na_list(k));
    
    for ite=4:4
        ite;
        % load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % load trained ANN net data. %%%%%%%%%%%%%%%%%%
        nnt_epochs_en= 6500 +  500 * ite;
        n_add_group=5;
        
        % store the pre result %%%%%%%%%%%%%%%%%%%%
%         na_fi_store=['../res_data/Pre_res_data/rand6000_315ser/Mat_',...
%             na_ser,'ser500_ite_',mat2str(nnt_epochs_en),...
%             '_del_0_add_',mat2str(n_add_group),'.mat'];

        % 
        load(na_fi_store);
        plot_rang=[-567.58 -567.535 -567.58  -567.535];
        
        re=dat_En_pr;
        si=out_si_pr_en_new;
        h=fun_plot_res_sqr(re,si,'en si ');
        % axis(plot_rang)
        
        fi_na=['../imgs/en/01rand_md/cong_tr/fig_en_',mat2str(nnt_epochs_en),'_congress'];
        fun_work_li_035_myfig_out(h,fi_na,3);
        
    end
end


%% logs
% mod : 09-Dec-2013 19:12:52
% 6000 + 2000 (3 - 15 Dia)

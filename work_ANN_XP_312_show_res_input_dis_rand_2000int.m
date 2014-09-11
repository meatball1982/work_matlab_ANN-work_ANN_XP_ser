clear all
clc

%% outline
% show ch,en,fs result
% atom dis (random) as the ANN input rep 10


%% en  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clf
% k=3;
% tr_rat=0.2+0.05*8;
% tr_rat_str=mat2str(100*tr_rat);
% i=2;
% fi_na=['../res_data/en/en_atom_dis_rand_difper/Mat_atom_dis_rand_',...
%                                      tr_rat_str,'_rep_',mat2str(i),'.mat'];
% load(fi_na);
% plot_rang=[-569.59 -569.55 -569.59 -569.55];
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


plot_rang=[-569.59 -569.55 -569.59 -569.55];

for k=1:14
% for k=1:2

tr_rat=0.2+0.05*k;
tr_rat_str=mat2str(100*tr_rat);

for i=1:10
%for i=1:2

    i_store=(k-1)*10+i
    fi_na=['../res_data/en/en_atom_dis_rand_difper/Mat_atom_dis_rand_',...
                                     tr_rat_str,'_rep_',mat2str(i),'.mat'];
    load(fi_na);        % load data
    
    % static tr 
    re=dat_En_tr;
    si=out_tr_pr_en;
    mat_en_stat_tr(:,i_store)=fun_static_err_v4(re,si);
    
    % plot tr congress
    clf
    h=fun_plot_res_sqr(re,si,['en tr atom dis ',tr_rat_str,' ',mat2str(i)]);
     axis(plot_rang)
     fi_na=['../imgs/en/03en_atom_dis_rand_difper/cong_tr/fig_en_',...
                                tr_rat_str,'_rep_',mat2str(i),'_congress'];
     fun_work_li_035_myfig_out(h,fi_na,3);
    
    % static si
    re=dat_En_si;
    si=out_si_pr_en;
    mat_en_stat_si(:,i_store)=fun_static_err_v4(re,si);
    
    % plot si congress
    clf
    h=fun_plot_res_sqr(re,si,['en si atom dis ',tr_rat_str,' ',mat2str(i)]);
    axis(plot_rang)
    fi_na=['../imgs/en/03en_atom_dis_rand_difper/cong_si/fig_en_',...
                                tr_rat_str,'_rep_',mat2str(i),'_congress'];
     fun_work_li_035_myfig_out(h,fi_na,3); 
    
end
end

%% logs
% mod : 30-Nov-2013 14:34:17
% mod : 28-Nov-2013 10:11:39
% show result of atom dis as ANN input.
%
% mod : 2013年 11月 26日 星期二 16:40:31 CST
% mod : 26-Nov-2013 14:04:10
% 
% mod : 20-Nov-2013 10:31:37
% 

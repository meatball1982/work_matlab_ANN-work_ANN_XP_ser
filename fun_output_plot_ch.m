function []=fun_output_plot_ch(fig_path,re,si,ite,epoch,num_den,flg_str)

er=(re(:)-si(:));
hi_bi=linspace(-0.05,0.05,41);
plot_range=[-0.05 0.05 0 1.1];


%----  sqrt plot ----------------------------
clf
str=[mat2str(epoch)];
h=fun_plot_res_sqr(re,si,str);
fi_na=[fig_path,'/fig',flg_str,'_01_sqrt_',...
    mat2str(ite),'_',mat2str(epoch),'_cong'];
fun_work_li_035_myfig_out(h,fi_na,3);

%----  sqrt plot density --------------------
clf
str=[mat2str(epoch)];
[h]=fun_plot_res_den(re,si,num_den);
fi_na=[fig_path,'/fig',flg_str,'_02_sqrt_',...
    mat2str(ite),'_',mat2str(epoch),'_den'];
fun_work_li_035_myfig_out(h,fi_na,3);

%----  er hist ----------------------------
clf
[hi_va]=hist(er,hi_bi);
h=bar(hi_bi,hi_va./max(hi_va(:)))
axis(plot_range)
title(mat2str(epoch))
fi_na=[fig_path,'/fig',flg_str,'_03_hist_',...
    mat2str(ite),'_',mat2str(epoch),'_err'];
fun_work_li_035_myfig_out(h,fi_na,3);

%% logs
% mod : 12-May-2014 14:56:22

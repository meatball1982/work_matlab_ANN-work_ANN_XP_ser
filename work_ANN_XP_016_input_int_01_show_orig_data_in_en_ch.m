clear all
clc
clf

%% output MD Ser int.

%% load data
load Mat_016_cluster_3_20Dia_int.mat
[m,n]=size(dat_in);

dat_En_new=fun_trans_en_v2(dat_En,1);

% plot(dat_En_new,'.')
[en_hist,en_bar]=hist(dat_En_new,40);

en_bar_tm=en_bar(1:8:end);
% hist_name=mat2str(floor(en_bar(1:10:end)*10^5)');
for i=1:length(en_bar_tm)
    hist_name{i}=mat2str(floor(en_bar_tm(i)));
end
h=bar(en_bar,en_hist,'FaceColor','y')
set(gca,'XTick',en_bar(1:8:end));
set(gca,'XTicklabel',hist_name);
title('Ser En')
fi_na=['../imgs/out_en/fig_out_en_cluster3_20_all_data'];
fun_work_li_035_myfig_out(h,fi_na,3);



%% plot ch
% atom_name={'C','H','H','H','C','O','N','H','C','H','C','H','H','O','H','C','O','N','H','C','H','H','H'};
% h=mesh(dat_Ch);
% view(0,90);
% axis([1 23 1 m]);
% set(gca,'XTick',[1:23]+0.5);
% set(gca,'XTicklabel',atom_name);
% title('Ser Ch')
% colorbar
% fi_na=['../imgs/out_ch/fig_out_ch_cluster3_20_all_data'];
% fun_work_li_035_myfig_out(h,fi_na,3);


%% plot ann input
% h=mesh(dat_in);
% view(0,90);
% axis([1 n+0.5 0 m]);
% hold on
% set(gca,'XTick',[13 35 55])
% set(gca,'XTicklabel',{'bond length','bond angle','dihedral'})
% 
% line([1  1],[1 m],[3 3],'LineWidth',3,'Color',[.0 .0 .0])
% line([23 23],[1 m],[3 3],'LineWidth',3,'Color',[.0 .0 .0])
% line([44 44],[1 m],[4 4],'LineWidth',3,'Color',[.0 .0 .0])
% line([63+0.25 63.25],[1 m],[4 4],'LineWidth',3,'Color',[.0 .0 .0])
% 
% colorbar
% title('Ser int')
% 
% fi_na=['../imgs/in_int/fig_in_int_cluster3_20_all_data'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% outline
% mod : 27-Feb-2014 15:59:57
% 
% mod : 27-Feb-2014 11:01:38
% plot the MD ser ann input(int)
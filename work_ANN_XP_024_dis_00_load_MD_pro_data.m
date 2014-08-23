clear all
clc
clf

%% outline
% load the MD traj protein ser data.
% the dis, en, ch, 

%% main
% data store path
path_store='../data/ANN_input_out_file_MD200_rand_draw/';

% load en data
fi_en=[path_store,'Out_en.txt'];
li_en=load(fi_en);
ind1=(li_en<-567.52);
ind2=(li_en>-570);
ind_cho=(ind1 & ind2);
dat_en_MD=li_en(ind_cho);

% load distance data from log
fi_dis=[path_store,'Out_dis.txt'];
li_dis=load(fi_dis);
tm=reshape(li_dis,253,[])';
dat_dis_MD=tm(ind_cho,:);

% load distance data from tinker xyz
fi_xyz=[path_store,'Out_dis_xyz.txt'];
tm=load(fi_xyz);
dat_dis_MD_xyz=tm(ind_cho,:);


% load charge data
fi_ch=[path_store,'Out_ch.txt'];
li_ch=load(fi_ch);
tm=reshape(li_ch,23,[])';
dat_ch_MD=tm(ind_cho,:);

save Mat_MD_dis_input_output.mat dat_en_MD dat_dis_MD dat_dis_MD_xyz dat_ch_MD


% % % x_ind
% % x_ind=[1:length(li_en)];
% % x_cho=x_ind(ind_cho);
% % 
% % 
% % % 
% % load Mat_2160_dis_input_output.mat dat2160_En
% % load Mat_320_dis_input_output.mat  dat320_En
% % test_en=load([path_store,'test_new_gen_gjf/en_test.txt']);
% % test_en_charm_HBond=load([path_store,'test_new_gen_gjf/out_en_test_charm_HB.txt']);
% % test_en_charm_HBond_serChain=load([path_store,'Ser_chain_charmm_HB/Eng_n75_charmHB_ser_chain.txt']);
% % 
% % % figure(1)
% % % plot(x_ind,li_en,'ro')
% % hold on
% % h=plot(x_cho,dat_en_MD,'b.')
% % hold on
% % plot(dat320_En(1:2:end),'g.')
% % plot(dat2160_En(1:2:end),'r.')
% % plot(test_en,'k.')
% % plot(length(test_en)+[1:length(test_en_charm_HBond)],test_en_charm_HBond,'y.')
% % plot(3000+[1:length(test_en_charm_HBond_serChain)],test_en_charm_HBond_serChain,'c.')
% % legend('MD pro','MD 3-20','MD 21-60','re gen Md pro','re gen Md pro charm HB','MD 17 charm HB')
% % 
% % % legend('MD pro','MD 3-20','MD 21-60')
% % axis([ 0 39000 -567.59 -567.50 ] )
% % % fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_en_dis'];
% % % fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_en_dis_add_test'];
% % % fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_en_dis_add_test_charmHB'];
% % % fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_en_dis_new_Md'];
% % fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_en_dis_new_Md_ser_chain_charmHB'];
% % fun_work_li_035_myfig_out(h,fi_na,3);

% figure(2)
% clf
% hi_bin=linspace(-567.58,-567.52,20);
% [hist_en_MD]=hist(dat_en_MD,hi_bin);
% [hist_en_320 ]=hist(dat320_En ,hi_bin);
% [hist_en_2160]=hist(dat2160_En,hi_bin);
% 
% hist_mat=[hist_en_MD./(length(dat_en_MD));
%           hist_en_320./(length(dat320_En));
%           hist_en_2160./(length(dat2160_En))];
%       
% bar_color=[ 0 0 1
%             0 1 0
%             1 0 0];

% h=bar(hi_bin,hist_mat','BarWidth',1.3)
% % bar3(hi_bin,hist_mat')
% alpha(0.7)
% colormap(bar_color)
% axis([-567.58,-567.52 0 0.18])
% legend('MD pro','MD 3-20','MD 21-60')
% fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_en_dis_new_Md_hist'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% % output 
% % surf(dat_dis_MD,'Edgecolor','none')
% % view(0,90)
%legend('MD pro','MD 3-20','MD 21-60')

% surf(dat_ch_MD,'Edgecolor','none')
% view(0,90)
% plot(dat_ch_MD,'.')


%% logs
% mod : 08-May-2014 09:51:45
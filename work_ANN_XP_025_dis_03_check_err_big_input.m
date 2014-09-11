clear all
clc

%% outline
% check the err ser input

%% main
% 
ind_er=load('txt_err_big.txt');
ind_er_en=load('txt_err_big_en.txt');

load Mat_MD_dis_input_output.mat dat_dis_MD
load Mat_atom_pair.mat atomrel

ind_all=[1:length(dat_dis_MD)]';

dat_dis_err=dat_dis_MD(ind_er,:);
tm=dat_dis_MD;
tm(ind_er_en,:)=[];
dat_dis_rig=tm;

% plot(dat_dis_rig,'.')
color_mm=[0 0 1
          1 0 0];
tm=randperm(length(dat_dis_rig(:,1)));

ind_cho_nor=tm(1:length(dat_dis_err(:,1)));

for i=1:253
    t1=dat_dis_err(:,i);
    t2=dat_dis_rig(:,i);

    str_pair=fun_gen_atom_pair(atomrel(i,:));
    
    mi=min(min(t1),min(t2));
    ma=max(max(t1),max(t2));
    hi_ba=linspace(mi,ma,20);
    h1=hist(t1,hi_ba);
    h2=hist(t2,hi_ba);
    h_all=[h1./sum(h1);h2./sum(h2)];
    
    
%     clf
%     h=plot(t2(ind_cho_nor),'b.')
%     hold on
%     plot(t1,'r.')
%     
%     title(['dis ',mat2str(i),'  ',str_pair,'point'])
%     legend('normal','error')
%     fi_na=['../imgs/en/25_find_err_big/dis/point/','fig_dis_',mat2str(i),'_point'];
%     fun_work_li_035_myfig_out(h,fi_na,3);
%     
    
    clf
    h=bar(hi_ba,h_all','BarWidth',1.2)
    colormap(color_mm)

    title(['dis ',mat2str(i),'  ',str_pair,' hist'])
    legend('normal','error')
    fi_na=['../imgs/en/25_find_err_big/dis/hist/','fig_dis_',mat2str(i),'_hist'];
    fun_work_li_035_myfig_out(h,fi_na,3);
end


% subplot(1,2,1)
% surf(dat_dis_rig(1:1742,:),'EdgeColor','none')
% view(0,90)
% 
% subplot(1,2,2)
% surf(dat_dis_err,'EdgeColor','none')
% view(0,90)
%% logs
% mod : 21-May-2014 15:21:40

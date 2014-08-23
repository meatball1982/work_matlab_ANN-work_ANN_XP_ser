
clear all
clc
%% plot 3-20 input

% load Mat_320_dis_input_output.mat
% 
% % subplot(1,2,1)
% h=mesh(dat320_in);
% [m,n]=size(dat320_in);
% view(0,90)
% axis([1 n 1 m])
% set(gca,'yTick',[10000 20000 30000 40000])
% set(gca,'yTickLabel',{'10000', '20000', '30000', '40000'})
% 
% fi_na=['../imgs/in_dis/ann_in_dis_320_nocolbar'];
% fun_work_li_035_myfig_out(h,fi_na,3);

load Mat_2160_dis_input_output.mat
h=mesh(dat2160_in);
[m,n]=size(dat2160_in);
view(0,90)
axis([1 n 1 m])
fi_na=['../imgs/in_dis/ann_in_dis_2160_nocolbar'];
fun_work_li_035_myfig_out(h,fi_na,3);


% colorbar
% fi_na=['../imgs/in_dis/ann_in_dis_320'];
% fun_work_li_035_myfig_out(h,fi_na,3);


% subplot(1,2,2)
% mesh(dat320_in(10000:28500,15:23))
% view(0,90)
% figure(2)
% plot(dat320_in(1:28500,18:18),'.')

%% logs
% mod : 07-Mar-2014 16:05:59

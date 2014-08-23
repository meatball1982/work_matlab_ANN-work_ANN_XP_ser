clear all
clc

%% compare MD chain ser dis

tm=load('../data/comp_MD_chain/txt_dis.txt');
dis_mat=reshape(tm,253,[])';

dis_MD=dis_mat(1:10,:);
dis_320=dis_mat(11:20,:);

tm=load('../data/comp_MD_chain/txt_dis_noalign.txt');
dis_mat_noalign=reshape(tm,253,[])';

dis_MD_noalign=dis_mat_noalign(11:20,:);
dis_320_noalign=dis_mat_noalign(1:10,:);



subplot(2,1,1)
h=plot(dis_MD','b.')
hold on
plot(dis_320','ro')
title('align')

subplot(2,1,2)
hold on
h=plot(dis_MD_noalign','b.')
hold on
plot(dis_320_noalign','ro')
title('no align')

fi_na=['../imgs/comp_MD_chain/comp_MD_320_align_noalign'];
fun_work_li_035_myfig_out(h,fi_na,3);




clear all
clc
clf

%% outline
% use the MD 320-2160 trained Ann to predict the MD protein ser.
% en
% use each ann to pred the en, find the err_big index. static when there r
% 10 times in which the ser r error. output the index out.

%% main
% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%
% load MD data
load Mat_MD_dis_input_output.mat
% load ann shift data
load Mat_n84_kfold_res.mat ANN_shift_mat

nnt_epochs_en      = 1e4;
nnt_epochs_en_init = 1e4;
nnt_epoch_en_add   = 2000;

% loop pre the 
for ite_con=1:19
    ite_con
if ite_con~=17%
    % path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    path_en_loop_save='../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/';

    nnt_epochs_en = nnt_epochs_en_init + nnt_epoch_en_add * ite_con;
    fi_mat=[path_en_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),...
                                  '_',mat2str(nnt_epochs_en),'_kfold.mat'];
%      load(fi_mat);

     load(fi_mat,'net_tr_en','er_thred','dat_in_tr' ,'dat_En_tr');
     
     [ dat_en_MD_pre ] = fun_ANN_pre_1net_trained...
                         (dat_in_tr,dat_En_tr,dat_dis_MD_xyz ,net_tr_en);
     
     pre_shift=ANN_shift_mat(ite_con);                
     dat_en_MD_pre=dat_en_MD_pre-pre_shift;
     
%      figure(ite_con)
%      plot(dat_en_MD,dat_en_MD_pre,'.');
%      hold on
%      plot(dat_en_MD,dat_en_MD_pre_shift,'r.');
%      axis equal
   
     ind_err_big = ( abs( dat_en_MD-dat_en_MD_pre) > 0.05 );
     ind_err_mat(ite_con,:)=ind_err_big;
end
end

tm=sum(double(ind_err_mat));

ind_err_output_ch=find(tm>=10)';

dlmwrite('txt_err_big_en.txt',ind_err_output_ch,'precision', '%d',...
    'delimiter', '\t','newline', 'Unix');



% plot(dat_En_va,dat_En_va_pre,'.')
% hold on 
% plot(dat_En_va,dat_En_va_pre-pre_shift,'r.')
% plot([-567.59 -567.53],[ -567.59 -567.53 ])
% axis([-567.59 -567.53  -567.59 -567.53 ])
% axis equal



% % load trained net
% fig_save_path='../res_data/en/en_atom_dis_cluster_320_2160_kfold/n84/';
% 
% load([fig_save_path,'Mat_loop_320_pre_2160_12_34000_kfold.mat'],...
%     'net_tr_en','dat_in_tr' ,'dat_En_tr','dat320_in','dat2160_in');
% 

% load([fig_save_path,'Mat_loop_320_pre_2160_18_46000_kfold.mat'],...
%     'net_tr_en','dat_in_tr' ,'dat_En_tr','dat320_in','dat2160_in');

% load([fig_save_path,'Mat_loop_320_pre_2160_12_34000_kfold.mat']);




% [ dat_en_MD_pre ] = fun_ANN_pre_1net_trained...
%                          (dat_in_tr,dat_En_tr,dat_dis_MD_xyz ,net_tr_en);
% 
%                       
% ind_er_big = find( abs( dat_en_MD-dat_en_MD_pre) > 0.02 );
% 
% h=plot(dat_en_MD,dat_en_MD_pre,'.')
% hold on
% 
% plot(dat_en_MD(ind_er_big),dat_en_MD_pre(ind_er_big),'r.')

% fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_pre_with_err'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% axis([-567.59 -567.51 -567.59 -567.51])
% axis equal
% fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_pre_with_err_part'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% save Mat_find_er_big1.mat ind_er_big
% save Mat_find_er_big2.mat ind_er_big

% ind=randi(30000,100,1);
% ind2=randi(6000,100,1);
% h=plot(dat_in_tr(ind,:)','r.');
% hold on
% plot(dat_dis_MD_xyz(ind,:)','b.');
% plot(dat320_in(ind2,:)','g.')
% legend('dat 320','dat MD')

% fi_na=['../imgs/en/24MD320_2160_ann_pre_MD_protein/fig_dif_input'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% logs
% mod : 21-May-2014 15:08:16
% 
% mod : 21-May-2014 14:34:43
% plot the congress MD and MD_shift.
% 
% mod : 21-May-2014 09:59:02
% 
% mod : 17-May-2014 09:32:47
% 
% mod : 14-May-2014 21:22:25
% mod : 13-May-2014 16:07:38
% judge ANN input
% 
% mod : 08-May-2014 09:42:03
% 
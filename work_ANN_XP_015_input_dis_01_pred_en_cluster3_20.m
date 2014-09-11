clear all
clc

%% outline
% %%%%%%%%%%%%%%%%%%%
% all the data are choosed by the cluster.
% 
% from 3Dia to 20Dia . each has 2500 ser

% choose all ser to train the ANN
% 
% %%%%%%%%%%%%%%%%%%%
% input:
% atom dis 
%
% %%%%%%%%%%%%%%%%%%%
% output
% 01. en
% 02. ch 

%% cd path
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% prm 
% n_inp =253;
% n_atom=23;
% 
% %% load data
% dat_path='../data/ANN_input_out_file_cluster/';
% dat_path_sub_in=['all_ANN_in/'];
% dat_path_sub_en=['all_ANN_en/'];
% dat_path_sub_ch=['all_ANN_ch/'];
% 
% dat_in=[];
% dat_En=[];
% dat_Ch=[];
% 
% % n_clu_beg=3;
% % n_clu_end=4;
% 
% n_clu_beg=3;
% n_clu_end=20;
% 
% for i=n_clu_beg:n_clu_end
%     i
%     in_tm    = load([dat_path,dat_path_sub_in,'ANN_in_dis_',mat2str(i),'.txt']);
%     En_tm    = load([dat_path,dat_path_sub_en,'ANN_HF_en_', mat2str(i),'ser_clu.txt']);
%     Ch_tm_li = load([dat_path,dat_path_sub_ch ,'ANN_HF_ch_mull_',mat2str(i),'ser_clu.txt']);
%     Ch_tm =reshape(Ch_tm_li,n_atom,[])';
% 
%     dat_in=[dat_in;in_tm];
%     dat_En=[dat_En;En_tm];
%     dat_Ch=[dat_Ch;Ch_tm];
% 
% end
% 
% clear En_tm in_tm Ch_tm_li Ch_tm
% 
% save Mat_015_cluster_3_20Dia.mat


load  Mat_015_cluster_3_20Dia.mat

n_con=length(dat_in(:,1));

n_per=1;
n_rep=1;
n_ite=1;

%% pre en and ch
for k=1:n_per

tr_rat=1;                % train percents
tr_rat_str=mat2str(100*tr_rat);
n_con=length(dat_in);
n_tr = floor(tr_rat*n_con);
n_sim= n_con-n_tr;

show_NaN   = NaN;   nnt_lr      = 0.05;  nnt_mc = 0.9;     % net parameters

for i=1:n_rep
    % choose train and sim data. 
    t_tmp=randperm(n_con);
    ind_tra=t_tmp(1:n_tr);
    ind_sim=ind_tra;
    
    % choose train index
    dat_in_tr=dat_in(ind_tra,:);
    dat_En_tr=dat_En(ind_tra,:);
%     dat_Ch_mu_tr=dat_Ch(ind_tra,:);
    
    % choose sim index
    dat_in_si=dat_in(ind_sim,:);
    dat_En_si=dat_En(ind_sim,:);
%     dat_Ch_mu_si=dat_Ch(ind_sim,:);
    
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);    
    for ite=1:n_ite
        % train the En ANN net
        tic
        %    nnt_epochs_en = 8000+ite*500;
        nnt_epochs_en = 1+ite*1;
        nnt_goal_en = 1e-5;                  % net parameters
        net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
        net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
        net_en.trainParam.showWindow=1;                              % show training
        [out_tr_pr_en,out_si_pr_en,er_tr_en,er_si_en,net_tr_en]=...
            fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_si,dat_En_si,net_en);
        t_en=toc;
%         fi_na=['../res_data/en/en_atom_dis_cluster/Mat_atom_dis_cluster_3_20Dia_trper',...
%             tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
%         save(fi_na);
    
%         % train the Ch ANN net
%         tic
%         %    nnt_epochs_ch = 2000+ite*1000;
%         nnt_epochs_ch = 1+ite*1;
%         nnt_goal_ch = 1e-5;                  % net parameters
%         net_ch = fun_gen_nnt(in_tr_01,n_atom*3, n_atom);          % mod : 08-Dec-2013 20:53:32
%         net_ch = fun_par_nnt(net_ch,show_NaN,nnt_lr,nnt_mc,nnt_epochs_ch,nnt_goal_ch);
%         net_ch.trainParam.showWindow=1;                              % show training
%         [out_tr_pr_ch_mull,out_si_pr_ch_mull,er_tr_ch_mull,er_si_ch_mull,net_tr_ch_mull]=...
%             fun_ANN_pre_1net(dat_in_tr,dat_Ch_mu_tr,dat_in_si,dat_Ch_mu_si,net_ch);
%         t_03_ch=toc;
%         fi_na=['../res_data/ch/ch_atom_dis_cluster/Mat_atom_dis_cluster_3_20Dia__trper',...
%             tr_rat_str,'_ite_',mat2str(nnt_epochs_ch),'_rep_',mat2str(i),'_del_',str_del,'.mat'];
%         save(fi_na);
    end
end
end



%% logs
% mod : 26-Dec-2013 21:40:28
% load data.

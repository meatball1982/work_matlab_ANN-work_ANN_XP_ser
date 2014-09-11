clear all
clc

%% outline
% %%%%%%%%%%%%%%%%%%%
% random choose 6000 ser from 10^5.
% use XP ser to train ANN
% random choose the ser.  
% 
% %%%%%%%%%%%%%%%%%%%
% input:
% atom dis 
%
% %%%%%%%%%%%%%%%%%%%
% output
% 01. en

%% cd path
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% prm 
n_inp =253;
n_atom=23;

%% load data
% ANN input data and En data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat_in      = load('../data/ANN_input_out_file_rand6000/ANN_in_dis.txt');
dat_En      = load('../data/ANN_input_out_file_rand6000/EuHF_ANN');

n_con=length(dat_in);

n_per=12;
n_rep=5;
n_ite=4;


% n_per=2;
% n_rep=2;
% n_ite=2;

%% pre en
 
for k=1:n_per

tr_rat=0.2+0.05*k;
tr_rat_str=mat2str(100*tr_rat);
n_con=length(dat_in);
n_tr = floor(tr_rat*n_con);
n_sim= n_con-n_tr;

show_NaN   = NaN;   nnt_lr      = 0.05;  nnt_mc = 0.9;     % net parameters
for i=1:n_rep
    t_tmp=randperm(n_con);
    ind_tra=t_tmp(1:n_tr);
    ind_sim=t_tmp((n_tr+1):end);
    
    dat_in_tr=dat_in(ind_tra,:);
    dat_En_tr=dat_En(ind_tra,:);
    
    dat_in_si=dat_in(ind_sim,:);
    dat_En_si=dat_En(ind_sim,:);
    
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);    
    
    tic
    for ite=1:n_ite
    nnt_epochs_en = 1000+ite*1000;
%    nnt_epochs_en = 1+ite*1;
    nnt_goal_en = 1e-5;                  % net parameters
    
    net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
    net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
    net_en.trainParam.showWindow=1;                              % show training
    [out_tr_pr_en,out_si_pr_en,er_tr_en,er_si_en,net_tr_en]=...
        fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_si,dat_En_si,net_en);
    t_en=toc;
    fi_na=['../res_data/en/en_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
                                     tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
    save(fi_na);
end
end
end



%% logs
% 
% mod : 27-Nov-2013 17:07:42
% atom dis as ann input.
% 
% mod : 21-Nov-2013 10:20:45
% big iteration 1000-3000
% mod : 2013年 11月 19日 星期二 20:35:06 HKT
% test en best net.
% mod : 19-Nov-2013 15:51:27
% big structure.

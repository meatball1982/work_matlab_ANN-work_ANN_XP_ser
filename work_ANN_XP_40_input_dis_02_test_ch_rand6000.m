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
% 01. ch

%% cd path
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% prm 
n_inp =253;
n_atom=23;

%% load data
% ANN input data and En data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat_in      = load('../data/ANN_input_out_file_rand6000/ANN_in_dis.txt');
dat_Ch_line = load('../data/ANN_input_out_file_rand6000/ANN_HF_ch_mull.txt');
dat_Ch      = reshape(dat_Ch_line,n_atom,[])';


n_con=length(dat_in);

n_per=14;
n_rep=5;
n_ite=20;

% n_per=1;
% n_rep=1;
% n_ite=1;

%% pre charge mu
 
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
    dat_Ch_mu_tr=dat_Ch(ind_tra,:);
    
    dat_in_si=dat_in(ind_sim,:);
    dat_Ch_mu_si=dat_Ch(ind_sim,:);
    
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);    
    
    tic
    for ite=1:n_ite
    nnt_epochs_ch = 1000+ite*500;
    % nnt_epochs_ch = 1+ite*1;
    % nnt_epochs_ch =4000;
    nnt_goal_ch = 1e-5;                  % net parameters
    
    net_ch = fun_gen_nnt(in_tr_01,n_atom*3, n_atom);          % mod : 27-Nov-2013 19:43:01

    net_ch = fun_par_nnt(net_ch,show_NaN,nnt_lr,nnt_mc,nnt_epochs_ch,nnt_goal_ch);
    net_ch.trainParam.showWindow=1;                              % show training
    [out_tr_pr_ch_mull,out_si_pr_ch_mull,er_tr_ch_mull,er_si_ch_mull,net_tr_ch_mull]=...
        fun_ANN_pre_1net(dat_in_tr,dat_Ch_mu_tr,dat_in_si,dat_Ch_mu_si,net_ch);

    t_03_ch=toc;
    fi_na=['../res_data/ch/ch_atom_dis_rand_6000/Mat_atom_dis_rand6000_trper',...
      tr_rat_str,'_ite_',mat2str(nnt_epochs_ch),'_rep_',mat2str(i),'.mat'];
    save(fi_na);
end
end
end



%% logs
% 
% mod : 06-Dec-2013 19:41:58
% atom dis as ann input, to predict ch mull.
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

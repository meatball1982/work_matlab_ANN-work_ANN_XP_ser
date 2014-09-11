clear all
clc

%% outline
% %%%%%%%%%%%%%%%%%%%
% ser choose from small protein
% choose certain percents to train the ANN
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
n_inp =253;
n_atom=23;

%% load data
% ANN input data and En data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load the small protein ser
dat_in = load('../data/ANN_input_out_file_small_protein/ANN_in_dis.txt');
dat_En = load('../data/ANN_input_out_file_small_protein/EuHF_ANN');
dat_Ch_line = load('../data/ANN_input_out_file_small_protein/ANN_HF_ch_mull.txt');
dat_Ch =reshape(dat_Ch_line,n_atom,[])';


ind_cho=dat_En<-567.5;
dat_in(~ind_cho,:)=[];
dat_En(~ind_cho,:)=[];
dat_Ch(~ind_cho,:)=[];


n_con=length(dat_in(:,1));

n_per=12;
n_rep=5;
n_ite=10;

% n_per=1;
% n_rep=1;
% n_ite=1;

%% pre en and ch
for k=1:n_per

tr_rat=0.25+0.05*k;                % train percents
tr_rat_str=mat2str(100*tr_rat);
n_con=length(dat_in(:,1));
n_tr = floor(tr_rat*n_con);
n_sim= n_con-n_tr;

show_NaN   = NaN;   nnt_lr      = 0.05;  nnt_mc = 0.9;     % net parameters

for i=1:n_rep
    % choose train and sim data. 
    t_tmp=randperm(n_con);
    ind_tra=t_tmp(1:n_tr);
    ind_sim=t_tmp((n_tr+1):end);
    
    dat_in_tr=dat_in(ind_tra,:);
    dat_En_tr=dat_En(ind_tra,:);
    dat_Ch_mu_tr=dat_Ch(ind_tra,:);
    
    dat_in_si=dat_in(ind_sim,:);
    dat_En_si=dat_En(ind_sim,:);
    dat_Ch_mu_si=dat_Ch(ind_sim,:);
    
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);    
    
    % train the En ANN net
    for ite=1:n_ite
        tic
        nnt_epochs_en = 50+ite*20;
        % nnt_epochs_en = 1+ite*1;
        nnt_goal_en = 1e-5;                  % net parameters
        
        net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
        net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
        net_en.trainParam.showWindow=1;                              % show training
        [out_tr_pr_en,out_si_pr_en,er_tr_en,er_si_en,net_tr_en]=...
            fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_si,dat_En_si,net_en);
        t_en=toc;
        fi_na=['../res_data/en/en_atom_dis_small_protein/Mat_atom_dis_small_protein_trper',...
            tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'.mat'];
        save(fi_na);
    end
    
    % train the Ch ANN net
    for ite=1:n_ite
        tic
        nnt_epochs_ch = 100+ite*50;
        % nnt_epochs_ch = 1+ite*1;
        nnt_goal_ch = 1e-5;                  % net parameters
 
        net_ch = fun_gen_nnt(in_tr_01,n_atom*3, n_atom);          % mod : 08-Dec-2013 20:53:32
        net_ch = fun_par_nnt(net_ch,show_NaN,nnt_lr,nnt_mc,nnt_epochs_ch,nnt_goal_ch);
        net_ch.trainParam.showWindow=1;                              % show training
        [out_tr_pr_ch_mull,out_si_pr_ch_mull,er_tr_ch_mull,er_si_ch_mull,net_tr_ch_mull]=...
            fun_ANN_pre_1net(dat_in_tr,dat_Ch_mu_tr,dat_in_si,dat_Ch_mu_si,net_ch);
        t_03_ch=toc;
        fi_na=['../res_data/ch/ch_atom_dis_small_protein/Mat_atom_dis_small_protein_trper',...
            tr_rat_str,'_ite_',mat2str(nnt_epochs_ch),'_rep_',mat2str(i),'.mat'];
        save(fi_na);
    end
    
end
end



%% logs
% mod : 08-Dec-2013 22:10:15
% use small protein to train the ANN net and pre.
% 
% mod : 08-Dec-2013 21:15:12
% Train the ANN net of En and Ch at the same time.
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

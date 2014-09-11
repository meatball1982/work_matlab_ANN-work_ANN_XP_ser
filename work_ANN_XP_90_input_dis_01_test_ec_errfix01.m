clear all
clc

%% outline
% %%%%%%%%%%%%%%%%%%%
% random choose 6000 ser from 10^5. plus 3-15Dia 5groups, each has 2000 ser
% now plus about 1000 ser from errfix 01
% 
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
n_inp =253;
n_atom=23;

%% load data
% ANN input data and En data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load the 6000 rand ser
dat_in_part01 = load('../data/ANN_input_out_file_rand6000/ANN_in_dis.txt');
dat_En_part01 = load('../data/ANN_input_out_file_rand6000/EuHF_ANN');
dat_Ch_part01_line = load('../data/ANN_input_out_file_rand6000/ANN_HF_ch_mull.txt');
dat_Ch_part01 =reshape(dat_Ch_part01_line,n_atom,[])';

clear dat_Ch_part01_line

n_part01=length(dat_in_part01);
n_part01_per=0.0;
str_del=mat2str(floor(100*n_part01_per));
n_del=floor(n_part01*n_part01_per);
t_tmp=randperm(n_part01);
ind_del=t_tmp(1:n_del);

% del the part01 data.
dat_in_part01(ind_del,:)=[];
dat_En_part01(ind_del,:)=[];
dat_Ch_part01(ind_del,:)=[];

% load the 3-15Dia, 2000 ser
dat_in_part02=[];
dat_En_part02=[];
dat_Ch_part02=[];

dat_path='../data/ANN_input_out_file_315Dia/'; % data store path
n_add_group=5;

for i=1:n_add_group
    dat_path_sub=['Lib',mat2str(i),'_2000/'];
    in_tm    = load([dat_path,dat_path_sub,'ANN_in_dis.txt']);
    En_tm    = load([dat_path,dat_path_sub,'ANN_HF_en_315ser2000.txt']);
    Ch_tm_li = load([dat_path,dat_path_sub,'ANN_HF_ch_315ser2000.txt']);
    Ch_tm =reshape(Ch_tm_li,n_atom,[])';
    
    dat_in_part02=[dat_in_part02;in_tm];
    dat_En_part02=[dat_En_part02;En_tm];
    dat_Ch_part02=[dat_Ch_part02;Ch_tm];
end

% load errifx01 data
dat_in_part03 = load('../data/ANN_input_out_file_errfix01/ANN_in_dis.txt');
dat_En_part03 = load('../data/ANN_input_out_file_errfix01/ANN_HF_en_errfix01.txt');
dat_Ch_part03_line = load('../data/ANN_input_out_file_errfix01/ANN_HF_ch_mull_errfix01.txt');
dat_Ch_part03 =reshape(dat_Ch_part03_line,n_atom,[])';


dat_in = [dat_in_part01;dat_in_part02;dat_in_part03];
dat_En = [dat_En_part01;dat_En_part02;dat_En_part03];
dat_Ch = [dat_Ch_part01;dat_Ch_part02;dat_Ch_part03];


clear in_tm En_tm Ch_tm Ch_tm_li
clear dat_in_part01 dat_En_part01 dat_Ch_part01_line dat_Ch_part01
clear dat_in_part02 dat_En_part02 dat_Ch_part02_line dat_Ch_part02
clear dat_in_part03 dat_En_part03 dat_Ch_part03_line dat_Ch_part03

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
    dat_Ch_mu_tr=dat_Ch(ind_tra,:);
    
    % choose sim index
    dat_in_si=dat_in(ind_sim,:);
    dat_En_si=dat_En(ind_sim,:);
    dat_Ch_mu_si=dat_Ch(ind_sim,:);
    
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
        fi_na=['../res_data/en/en_atom_dis_errfix01/Mat_atom_dis_errfix01_trper',...
            tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'_del_',str_del,'.mat'];
        save(fi_na);
    
        % train the Ch ANN net
        tic
        %    nnt_epochs_ch = 2000+ite*1000;
        nnt_epochs_ch = 1+ite*1;
        nnt_goal_ch = 1e-5;                  % net parameters
        net_ch = fun_gen_nnt(in_tr_01,n_atom*3, n_atom);          % mod : 08-Dec-2013 20:53:32
        net_ch = fun_par_nnt(net_ch,show_NaN,nnt_lr,nnt_mc,nnt_epochs_ch,nnt_goal_ch);
        net_ch.trainParam.showWindow=1;                              % show training
        [out_tr_pr_ch_mull,out_si_pr_ch_mull,er_tr_ch_mull,er_si_ch_mull,net_tr_ch_mull]=...
            fun_ANN_pre_1net(dat_in_tr,dat_Ch_mu_tr,dat_in_si,dat_Ch_mu_si,net_ch);
        t_03_ch=toc;
        fi_na=['../res_data/ch/ch_atom_dis_errfix01/Mat_atom_dis_errfix01_trper',...
            tr_rat_str,'_ite_',mat2str(nnt_epochs_ch),'_rep_',mat2str(i),'_del_',str_del,'.mat'];
        save(fi_na);
    end
end
end


%% logs
% 
% mod : 09-Dec-2013 15:50:35
% rand choose from 6000 ser. 
% 
% mod : 09-Dec-2013 14:58:12
% loop 2 add data into all train  
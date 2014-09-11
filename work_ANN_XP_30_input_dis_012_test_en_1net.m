clear all
clc

%% outline
% %%%%%%%%%%%%%%%%%%%
% use XP ser to train ANN
% random choose the ser.  
% %%%%%%%%%%%%%%%%%%%
% input:
% atom dis 
%
% %%%%%%%%%%%%%%%%%%%
% output
% 01. en
% 02. ch (mull)
% 03. ch (resp)
% 04. fs 

%% cd path
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
% cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% prm 
n_inp =253;
n_atom=23;

%% load data
% train data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ann in tr  %%%%%%%%%%%%%%%%%%%%%%%%
dat_in_tr     = load('../data/ANN_input_out_file_tr/ANN_input_dis.txt');

% ann out tr %%%%%%%%%%%%%%%%%%%%%%%%
dat_En_tr    = load('../data/ANN_input_out_file_tr/ANN_mp2_en.txt');  % en
dat_muli     = load('../data/ANN_input_out_file_tr/ANN_mp2_ch_mull.txt');
dat_Ch_mull_tr = reshape(dat_muli,n_atom,[])';                      % ch mull
dat_reli     = load('../data/ANN_input_out_file_tr/ANN_mp2_ch_resp.txt');
dat_Ch_resp_tr = reshape(dat_reli,n_atom,[])';                      % ch resp
dat_Fs_tr    = load('../data/ANN_input_out_file_tr/ANN_mp2_fs.txt');  % fs

% sim data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ann in si %%%%%%%%%%%%%%%%%%%%%%%%
dat_in_si      = load('../data/ANN_input_out_file_si/ANN_input_dis.txt');
% ann out si %%%%%%%%%%%%%%%%%%%%%%%%
dat_En_si    = load('../data/ANN_input_out_file_si/ANN_mp2_en.txt');  % en
dat_muli     = load('../data/ANN_input_out_file_si/ANN_mp2_ch_mull.txt');
dat_Ch_mull_si = reshape(dat_muli,n_atom,[])';                      % ch mull
dat_reli     = load('../data/ANN_input_out_file_si/ANN_mp2_ch_resp.txt');
dat_Ch_resp_si = reshape(dat_reli,n_atom,[])';                      % ch resp
dat_Fs_si    = load('../data/ANN_input_out_file_si/ANN_mp2_fs.txt');  % fs

dat_in      = [dat_in_tr   ;dat_in_si   ];
dat_En      = [dat_En_tr   ;dat_En_si   ];
dat_Ch_mull = [dat_Ch_mull_tr;dat_Ch_mull_si];
dat_Ch_resp = [dat_Ch_resp_tr;dat_Ch_resp_si];
dat_Fs      = [dat_Fs_tr   ;dat_Fs_si   ];

clear dat_En_tr dat_En_si 
clear dat_Ch_mull_tr dat_Ch_mull_si
clear dat_Ch_resp_tr dat_Ch_resp_si
clear dat_Fs_tr dat_Fs_si
clear ann_in_line dat_muli dat_reli

for k=9:9
% for k=1:2

tr_rat=0.2+0.05*k;
tr_rat_str=mat2str(100*tr_rat);
n_con=length(dat_in);
n_tr = floor(tr_rat*n_con);
n_sim= n_con-n_tr;


%% pre en
show_NaN   = NaN;   nnt_lr      = 0.05;  nnt_mc = 0.9;     % net parameters
for i=1:1
% for i=1:2    
    t_tmp=randperm(n_con);
    ind_tra=t_tmp(1:n_tr);
    ind_sim=t_tmp((n_tr+1):end);
    
    dat_in_tr=dat_in(ind_tra,:);
    dat_En_tr=dat_En(ind_tra,:);
    dat_Ch_mull_tr=dat_Ch_mull(ind_tra,:);
    dat_Ch_resp_tr=dat_Ch_resp(ind_tra,:);
    dat_Fs_tr = dat_Fs(ind_tra,:);
    
    dat_in_si=dat_in(ind_tra,:);
    dat_En_si=dat_En(ind_tra,:);
    dat_Ch_mull_si=dat_Ch_mull(ind_sim,:);
    dat_Ch_resp_si=dat_Ch_resp(ind_sim,:);
    dat_Fs_si = dat_Fs(ind_sim,:);
    
    [in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);
    
    
    tic
    % 	nnt_epochs_en = 1000+i*200;
    nnt_epochs_en = 2000;
    nnt_goal_en = 1e-5;                  % net parameters
    
    net_en = fun_gen_nnt(in_tr_01,3*n_atom, 1);
    net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
    net_en.trainParam.showWindow=1;                              % show training
    [out_tr_pr_en,out_si_pr_en,er_tr_en,er_si_en,net_tr_en]=...
        fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_si,dat_En_si,net_en);
    t_en=toc;
%     fi_na=['../res_data/en/en_atom_dis_rand_difper/Mat_atom_dis_rand_',...
%                                      tr_rat_str,'_rep_',mat2str(i),'.mat'];
%     save(fi_na);
    save Mat_temp_2_test_en_1net.mat
    end
end

%% logs
% mod : 29-Nov-2013 09:58:16
% use iteration of 2000. different per of data to train the ann. 
% the left sim.
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

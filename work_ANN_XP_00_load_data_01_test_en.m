clear all
clc

%% outline
% use XP ser to train ANN
% %%%%%%%%%%%%%%%%%%%
% input:
% 01.bond length
% 02.bond angle
% 03.dihedral 
% 04.i don't know what is that
% %%%%%%%%%%%%%%%%%%%
% output
% 01. en
% 02. ch (mull)
% 03. ch (resp)
% 04. fs 

%% cd path
% cd /raid4/data/liyan/work_2011b/work_ANN_ml/work_ANN_XP_ser/m_files
cd /data/liyan/work_matlab/work_ANN_ml/work_ANN_XP_ser/m_files

%% prm 
n_inp =83;
n_atom=23;

%% load data
% train data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ann in tr  %%%%%%%%%%%%%%%%%%%%%%%%
ann_in_line  = load('../data/ANN_input_out_file_tr/ANN_input.txt');
dat_in_tr    = reshape(ann_in_line,n_inp,[])';   
% ann out tr %%%%%%%%%%%%%%%%%%%%%%%%
dat_En_tr    = load('../data/ANN_input_out_file_tr/ANN_mp2_en.txt');  % en
dat_muli     = load('../data/ANN_input_out_file_tr/ANN_mp2_ch_mull.txt');
dat_Ch_mu_tr = reshape(dat_muli,n_atom,[])';                      % ch mull
dat_reli     = load('../data/ANN_input_out_file_tr/ANN_mp2_ch_resp.txt');
dat_Ch_re_tr = reshape(dat_reli,n_atom,[])';                      % ch resp
dat_Fs_tr    = load('../data/ANN_input_out_file_tr/ANN_mp2_fs.txt');  % fs

% sim data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ann in si %%%%%%%%%%%%%%%%%%%%%%%%
ann_in_line  = load('../data/ANN_input_out_file_si/ANN_input.txt');
dat_in_si    = reshape(ann_in_line,n_inp,[])';   
% ann out si %%%%%%%%%%%%%%%%%%%%%%%%
dat_En_si    = load('../data/ANN_input_out_file_si/ANN_mp2_en.txt');  % en
dat_muli     = load('../data/ANN_input_out_file_si/ANN_mp2_ch_mull.txt');
dat_Ch_mu_si = reshape(dat_muli,n_atom,[])';                      % ch mull
dat_reli     = load('../data/ANN_input_out_file_si/ANN_mp2_ch_resp.txt');
dat_Ch_re_si = reshape(dat_reli,n_atom,[])';                      % ch resp
dat_Fs_si    = load('../data/ANN_input_out_file_si/ANN_mp2_fs.txt');  % fs

clear ann_in_line dat_muli dat_reli

[in_tr_01,in_tr_01_s]=mapminmax(dat_in_tr',0,1);       
%% pre en

show_NaN   = NaN;   nnt_lr      = 0.05;  nnt_mc = 0.9;     % net parameters

for i=1:20
	nnt_epochs_en = 1000+i*500; 
	nnt_goal_en = 1e-5;                  % net parameters
	% nnt_epochs_en = 5;  nnt_goal_en = 1e-4;                  % net parameters
	net_en = fun_gen_nnt(in_tr_01,n_atom, 1);
	net_en = fun_par_nnt(net_en,show_NaN,nnt_lr,nnt_mc,nnt_epochs_en,nnt_goal_en);
	net_en.trainParam.showWindow=1;                              % show training
	[out_tr_pr_en,out_si_pr_en,er_tr_en,er_si_en,net_tr_en]=...
          fun_ANN_pre_1net(dat_in_tr,dat_En_tr,dat_in_si,dat_En_si,net_en);
	fi_na=['../res_data/en/en_dif_intmax/Mat_dif_intmax_',mat2str(nnt_epochs_en),'.mat'];
	save(fi_na);
end

%% logs
% mod : 2013年 11月 19日 星期二 20:35:06 HKT
% test en best net.
% mod : 19-Nov-2013 15:51:27
% big structure.

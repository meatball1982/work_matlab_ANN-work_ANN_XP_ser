clear all
clc

%% outline
% use 3-20 ser 
% loop train ANN to predict 21-60 ser.
% 00 load data 

%% main part
n_inp = 253;
n_atom=23;

%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % load 3-20 ser data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dat_path320='../data/ANN_input_out_file_cluster/';
% % path 3-20 ser
% dat_path320_sub_in=['all_ANN_in/'];
% dat_path320_sub_en=['all_ANN_en/'];
% dat_path320_sub_ch=['all_ANN_ch/'];
% 
% dat320_in=[];
% dat320_En=[];
% dat320_Ch=[];
% 
% % n_clu_beg=3;
% % n_clu_end=4;
% 
% n_clu_beg=3;
% n_clu_end=20;
% 
% % for load data 
% for i=n_clu_beg:n_clu_end
%     i
%     in_tm    = load([dat_path320,dat_path320_sub_in,'ANN_in_dis_',mat2str(i),'.txt']);
%     En_tm    = load([dat_path320,dat_path320_sub_en,'ANN_HF_en_', mat2str(i),'ser_clu.txt']);
%     Ch_tm_li = load([dat_path320,dat_path320_sub_ch,'ANN_HF_ch_mull_',mat2str(i),'ser_clu.txt']);
%     Ch_tm =reshape(Ch_tm_li,n_atom,[])';
% 
%     dat320_in=[dat320_in;in_tm];
%     dat320_En=[dat320_En;En_tm];
%     dat320_Ch=[dat320_Ch;Ch_tm];untitled.m
% 
%     len_mat320(i)=length(in_tm);
% end
% 
% clear En_tm in_tm Ch_tm_li Ch_tm
% clear dat_path320_sub_in 
% clear dat_path320_sub_en
% clear dat_path320_sub_ch
% 
% save Mat_320_dis_input_output.mat dat320_in dat320_Ch dat320_En n_inp n_atom

% load 21-60 ser data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat_path2160='../data/ANN_input_out_file_cluster2160/';
% path 21-60 ser
dat_path2160_sub_in=['all_ANN_in/'];
dat_path2160_sub_en=['all_ANN_en/'];
dat_path2160_sub_ch=['all_ANN_ch/'];

dat2160_in=[];
dat2160_En=[];
dat2160_Ch=[];

n_clu_beg=1;
n_clu_end=4;

% for load data 
for i=n_clu_beg:n_clu_end
    i
    in_tm    = load([dat_path2160,dat_path2160_sub_in,'ANN_in_dis_',mat2str(i),'.txt']);
    En_tm    = load([dat_path2160,dat_path2160_sub_en,'ANN_HF_en_', mat2str(i),'ser_clu.txt']);
    Ch_tm_li = load([dat_path2160,dat_path2160_sub_ch,'ANN_HF_ch_mull_',mat2str(i),'ser_clu.txt']);
    Ch_tm =reshape(Ch_tm_li,n_atom,[])';

    dat2160_in=[dat2160_in;in_tm];
    dat2160_En=[dat2160_En;En_tm];
    dat2160_Ch=[dat2160_Ch;Ch_tm];

    len_mat2160(i)=length(in_tm);
end

save Mat_2160_dis_input_output.mat dat2160_in dat2160_Ch dat2160_En n_inp n_atom




%% logs
% mod : 07-Mar-2014 16:51:22
% load the 3-20ser and 21-60 ser data
% 

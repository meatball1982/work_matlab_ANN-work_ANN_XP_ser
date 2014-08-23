clear all
clc

%% outline 
% use the MD 320-2160 trained Ann to predict the MD protein ser.
% ch

%% main
% load MD data
load Mat_MD_dis_input_output.mat

% load the ch trained net
% path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path_ch_loop_save='../res_data/ch/ch_atom_dis_cluster_320_2160_kfold/';

nnt_epochs_ch_init = 4000;
nnt_epoch_ch_add   = 1000;


for ite_con=1:5
    ite_con
    % path parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    path_ch_loop_save='../res_data/ch/ch_atom_dis_cluster_320_2160_kfold/';
    
    nnt_epochs_ch = nnt_epochs_ch_init + nnt_epoch_ch_add * ite_con;
    fi_mat=[path_ch_loop_save,'Mat_loop_320_pre_2160_',mat2str(ite_con),...
                               '_',mat2str(nnt_epochs_ch),'_kfold_ch.mat'];
%     load(fi_mat);                       
    load(fi_mat,'all_data_in','all_data_out','dat_in_tr','dat_Ch_tr',...
        'net_tr_ch');
    
    [ dat_ch_MD_pre ] = fun_ANN_pre_1net_trained...
                          (dat_in_tr,dat_Ch_tr,dat_dis_MD_xyz ,net_tr_ch);
    
    
    er_mat=abs(dat_ch_MD_pre-dat_ch_MD);
    
    ind_er=er_mat>0.1;
    ind_err_big=(sum(double(ind_er'))>8)';
    
    ind_err_mat(ite_con,:)=ind_err_big;
    
end

plot(dat_ch_MD,dat_ch_MD_pre,'.')


% tm=sum(double(ind_err_mat));
% 
% ind_err_output_ch=find(tm==5)';
% 
% dlmwrite('txt_err_big_ch.txt',ind_err_output_ch,'precision', '%d',...
%     'delimiter', '\t','newline', 'Unix');

%% logs
% mod : 20-May-2014 15:22:59

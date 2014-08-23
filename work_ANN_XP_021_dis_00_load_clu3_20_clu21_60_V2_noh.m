clear all
close all
clc

%% outline
% gen the noh atom - atom distance 
% draw from 44986*253 matrix.
% this m file draw the index


%% load data
load Mat_320_dis_input_output.mat  dat320_in  dat320_En  dat320_Ch
load Mat_2160_dis_input_output.mat dat2160_in dat2160_En dat2160_Ch

% noh index of the Ser
Ind_at=[ 1 0 0 0 1 1 1 0 1 0 1 0 0 1 0 1 1 1 0 1 0 0 0];

% find the noh index of the distance matrix
Ind_noh=[];
for i=1:22
    for j=(i+1):23
        tm=Ind_at(i)*Ind_at(j);
        Ind_noh=[Ind_noh;tm];
    end
end
Ind_noh        = logical(Ind_noh);

% choose the noh atom dis 
dat320_in_noh  = dat320_in(:,Ind_noh);
dat2160_in_noh = dat2160_in(:,Ind_noh);

% 
save Mat_320_dis_input_output.mat  dat320_in_noh  dat320_En  dat320_Ch
save Mat_2160_dis_input_output.mat dat2160_in_noh dat2160_En dat2160_Ch

% h=surf(dat320_in_noh,'EdgeColor','none');
% title('dis noh 320')
% view(0,90)
% axis tight
% colorbar
% fi_na=['../imgs/in_dis_noh/ann_in_dis_320_noh'];
% fun_work_li_035_myfig_out(h,fi_na,3);
% 
% close all
% h=surf(dat2160_in_noh,'EdgeColor','none');
% title('dis noh 2160')
% view(0,90)
% axis tight
% colorbar
% fi_na=['../imgs/in_dis_noh/ann_in_dis_2160_noh'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% logs
% mod : 15-Aug-2014 20:24:11
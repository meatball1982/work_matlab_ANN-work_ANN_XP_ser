clear all
clc

%% outline
% gen the noh atom - atom int  
% draw from 44986 * 63 matrix.
% this m file draw the index


%% load data
load Mat_016_cluster_3_20Dia_int.mat

ind_int=load('../sh_file/work_draw_int_noh_ind/ind_int.txt');
ind_at=load('../sh_file/work_draw_int_noh_ind/ind_at.txt');

% Ind_Dia=[49,53,58];
Ind_Dia=[49,54,58];

a=ind_int;
b=ind_at;

Ind_noh=[];
dia_noh=[];

% choose bond length
for i=2:23
    ind1=a(i,1);
    ind2=a(i,2);
    tm=b(ind1)*b(ind1);
    Ind_noh=[Ind_noh,tm];
end
% ind_noh

% choose bond angle
for i=3:23
    ind1=a(i,1);
    ind2=a(i,2);
    ind3=a(i,3);
    tm=b(ind1)*b(ind2)*b(ind3);
    Ind_noh=[Ind_noh,tm];
end
% ind_noh

% choose dia 
dia_all=[]
for i=4:23
    ind1=a(i,1);
    ind2=a(i,2);
    ind3=a(i,3);
    ind4=a(i,4);
    tm=b(ind1)*b(ind2)*b(ind3)*b(ind4);
    dia_all=[dia_all;ind1-1,ind2-1,ind3-1,ind4-1,tm];
    if tm==1
        dia_noh=[dia_noh;ind1,ind2,ind3,ind4];
    end
        
    Ind_noh=[Ind_noh,tm];    
end

Ind_noh=logical(Ind_noh);
dat320_in_noh=dat_in(:,Ind_noh);
dat320_in_dia=dat_in(:,Ind_Dia);

clear a b i ind1 ind2 ind3 ind4 n_clu_beg n_clu_end tm

% save Mat_320_int_input_output.mat 
save Mat_320_int_input_output54.mat 

%% logs 
% mod : 16-Aug-2014 21:27:57
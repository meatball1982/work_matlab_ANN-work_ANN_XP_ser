clear all
clc

%% outline
% gen the noh atom  int name and index


%% load data
load Mat_016_cluster_3_20Dia_int.mat

ind_int = load('../sh_file/work_draw_int_noh_ind/ind_int.txt');
ind_at  = load('../sh_file/work_draw_int_noh_ind/ind_at.txt');
na_at   = {'C','C','O','H','H','H','N','C','C','O','H','H','C',...
           'O','H','H','H','N','C','H','H','H','H'};


% Ind_Dia=[49,53,58];
Ind_Dia=[49,54,58];

a=ind_int;
b=ind_at;

Ind_noh=[];
dia_noh=[];
ang_noh=[];
bod_noh=[];

dia_na=[];
ang_na=[];
bod_na=[];


% choose bond length
for i=2:23
    ind1=a(i,1);
    ind2=a(i,2);
    tm=b(ind1)*b(ind2);
    Ind_noh=[Ind_noh,tm];
    if tm~=0
        bod_noh=[bod_noh;ind1,ind2];
        bod_na=[bod_na;na_at(ind1),mat2str(ind1-1),na_at(ind2),mat2str(ind2-1)];
    end
end
bod_na

% choose bond angle
con_ang=0;
for i=3:23
    ind1=a(i,1);
    ind2=a(i,2);
    ind3=a(i,3);
    tm=b(ind1)*b(ind2)*b(ind3);
    Ind_noh=[Ind_noh,tm];
    if tm~=0
        con_ang=con_ang+1;
        ang_noh=[ang_noh;ind1,ind2,ind3];
        ang_na=[ang_na;na_at(ind1),mat2str(ind1-1),...
                       na_at(ind2),mat2str(ind2-1),...
                       na_at(ind3),mat2str(ind3-1)];
    end
end
ang_na


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
        dia_na=[dia_na;na_at(ind1),mat2str(ind1-1),...
                       na_at(ind2),mat2str(ind2-1),...
                       na_at(ind3),mat2str(ind3-1),...
                       na_at(ind4),mat2str(ind4-1)];
    end
        
    Ind_noh=[Ind_noh,tm];    
end
dia_na

save Mat_int_noh_name.mat bod_na ang_na dia_na

%% logs
% mod : 09-Sep-2014 10:19:35

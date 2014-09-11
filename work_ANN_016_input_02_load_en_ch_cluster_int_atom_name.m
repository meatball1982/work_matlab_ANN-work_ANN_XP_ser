clear all
clc

%% outline
% gen the all atom  int name and index

%% load data
load Mat_016_cluster_3_20Dia_int.mat

ind_int = load('../sh_file/work_draw_int_noh_ind/ind_int.txt');
ind_at  = load('../sh_file/work_draw_int_noh_ind/ind_at.txt');
na_at   = {'C','C','O','H','H','H','N','C','C','O','H','H','C',...
           'O','H','H','H','N','C','H','H','H','H'};

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
    bod_noh=[bod_noh;ind1,ind2];
    tm_str=strcat(mat2str(ind1-1),na_at(ind1),'-',mat2str(ind2-1),na_at(ind2));
    bod_na=[bod_na;tm_str];
end
bod_na

% choose bond angle
for i=3:23
    ind1=a(i,1);
    ind2=a(i,2);
    ind3=a(i,3);
    
    tm_str=strcat(mat2str(ind1-1),na_at(ind1),'-',...
                  mat2str(ind2-1),na_at(ind2),'-',...
                  mat2str(ind3-1),na_at(ind3));
    ang_na=[ang_na;tm_str];

end
ang_na

% choose dia 
for i=4:23
    ind1=a(i,1);
    ind2=a(i,2);
    ind3=a(i,3);
    ind4=a(i,4);

    tm_str=strcat(mat2str(ind1-1),na_at(ind1),'-',...
                  mat2str(ind2-1),na_at(ind2),'-',...
                  mat2str(ind3-1),na_at(ind3),'-',...
                  mat2str(ind4-1),na_at(ind4));
                    
    dia_na=[dia_na;tm_str];
   
end
dia_na

save Mat_int_name.mat bod_na ang_na dia_na

%% logs
% mod : 11-Sep-2014 20:15:02
% mod : 11-Sep-2014 17:11:44
% mod : 09-Sep-2014 10:19:35

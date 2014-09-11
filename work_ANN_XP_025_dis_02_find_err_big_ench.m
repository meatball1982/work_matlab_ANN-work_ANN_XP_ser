clear all
clc

%% outline
% find the en, and ch err big index.
% check the ser

%% main
ind_en=load('txt_err_big_en.txt');
ind_ch=load('txt_err_big_ch.txt');

ind_err=intersect(ind_en,ind_ch);

% dlmwrite('txt_err_big.txt',ind_err,'precision', '%d',...
%     'delimiter', '\t','newline', 'Unix');
 

%% logs
% mod : 21-May-2014 15:10:47

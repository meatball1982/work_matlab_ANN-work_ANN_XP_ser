clear all
clc
clf

%% outline
% pca the dia angle (7 group) to illustrate the phi and psi are the main 2
% facters.

%% load data 
load Mat_320_int_input_output.mat 
% dat320_in_noh
b=dat320_in_noh(:,end-6:end);
b(b<0)=b(b<0)+2*pi;

% [coeff,score,latent] = princomp(b);
% 
% coeff
% 
% latent
% 
% dia_noh-1

n=length(b);
x_ind=[1:900:n];
plot(b(x_ind,:))
hold on
plot(dat_En(x_ind),'k-')
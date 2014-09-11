clear all
clc

%% outline
% study PCA example

load hald;
[pc, score, latent, tsquare ] =  princomp(ingredients);

% load Mat_320_int_input_output.mat 
% % dat320_in_noh
% b=dat320_in_noh(:,end-6:end);
% b(b<0)=b(b<0)+2*pi;

% [pc, score, latent, tsquare ] =  princomp(b);



pc,latent

cumsum(latent)./sum(latent)

% biplot(pc(:,1:2),'Scores',score(:,1:2),'VarLabels',...
%     {'X1' 'X2' 'X3' 'X4'})

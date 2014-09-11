% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by NFTOOL
% Created Fri Feb 28 12:02:05 CST 2014
%
% This script assumes these variables are defined:
%
%   dat_in - input data.
%   dat_En - target data.
clear all
clc

load  Mat_016_cluster_3_20Dia_int.mat

dat_ch_1=dat_Ch(:,1);

% inputs = dat_in';
% targets = dat_En';
% 
% % Create a Fitting Network
% hiddenLayerSize = 23;
% 
% net = fitnet(hiddenLayerSize);
% 
% 
% % Setup Division of Data for Training, Validation, Testing
% net.divideParam.trainRatio = 35/100;
% net.divideParam.valRatio = 35/100;
% net.divideParam.testRatio = 30/100;
% 
% net.trainParam.max_fail=20;
% 
% % Train the Network
% [net,tr] = train(net,inputs,targets);
% 
% % Test the Network
% outputs = net(inputs);
% errors = gsubtract(targets,outputs);
% performance = perform(net,targets,outputs)
% 
% % View the Network
% view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotfit(net,inputs,targets)
%figure, plotregression(targets,outputs)
%figure, ploterrhist(errors)

function [out_si_pr]=...
               fun_ANN_pre_1net_trained(in_tr,out_tr,in_si,net_tr);
%
% [out_si_pr]=...
%                fun_ANN_pre_1net_trained(in_tr,out_tr,in_si,net_trained);
% using ONE trained net, predict the new ser parameters. 
%
% Inputs:
% in_tr        -- train input
% out_tr       -- train out real
% in_si        -- prediction input
% net_tr       -- trained network
% Outputs:
% out_si_pr    -- simulation output predicted

%% 
% normalize the input and output
[pn,ps]   = mapminmax(in_tr', 0,1);
[tn,ts]   = mapminmax(out_tr',0,1);

% predict the dat
pnewn     = mapminmax('apply'  ,in_si',ps);
anewn     = sim(net_tr,pnewn);
out_si_pr = mapminmax('reverse',anewn,ts)';

% % static the error
% [er_tr]   = fun_static_err_v3(out_tr(:),out_tr_pr(:));
% [er_si]   = fun_static_err_v3(out_si(:),out_si_pr(:));

%% logs
% modified on : 24-Jun-2013 14:17:12
% modified by : mm
% based on   fun_ANN_pre_1net.m , modify this function to pre the
% parameters with 1 trained net with the distance from each pair of atoms 
% in new generated ser.
% 
% modified on : 19-Jan-2013 11:00:14
% typed by : mm

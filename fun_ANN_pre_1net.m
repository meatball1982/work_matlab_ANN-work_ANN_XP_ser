function [out_tr_pr,out_si_pr,er_tr,er_si,net_tr]=...
               fun_ANN_pre_1net(in_tr,out_tr,in_si,out_si,net);
%
% [out_tr_pr,out_si_pr,er_tr,er_si,net_tr]=...
%                fun_ANN_pre_1net(in_tr,out_tr,in_si,out_si,net);
% using ONE net, train the net, predict the data. 
%
% Inputs:
% in_tr     -- train input
% out_tr    -- train out real
% in_si     -- simulation input
% out_si    -- simulation out real 
% net       -- network
% Outputs:
% out_tr_pr -- train output predicted
% out_si_pr -- simulation output predicted
% er_tr     -- train error 
% er_si     -- simulation error
% net_tr    -- trained network
%
% modified on : 19-Jan-2013 11:00:14
% typed by : mm

%% 
% normalize the input and output
[pn,ps]   = mapminmax(in_tr', 0,1);
[tn,ts]   = mapminmax(out_tr',0,1);

% train the network
net_tr    = train(net,pn,tn);

% pre the simluated dat
an        = sim(net_tr,pn);
out_tr_pr = mapminmax('reverse',an,ts)';

% predict the dat
pnewn     = mapminmax('apply'  ,in_si',ps);
anewn     = sim(net_tr,pnewn);
out_si_pr = mapminmax('reverse',anewn,ts)';

% static the error
[er_tr]   = fun_static_err_v3(out_tr(:),out_tr_pr(:));
[er_si]   = fun_static_err_v3(out_si(:),out_si_pr(:));


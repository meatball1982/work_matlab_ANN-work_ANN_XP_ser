function [net0]= fun_par_nnt(net0,show_NaN,nnt_lr,nnt_mc,nnt_epochs,nnt_goal)

net0.trainParam.show    = show_NaN;
net0.trainParam.lr      = nnt_lr  ;
net0.trainParam.mc      = nnt_mc  ;
net0.trainParam.epochs  = nnt_epochs ;
net0.trainParam.goal    = nnt_goal ;



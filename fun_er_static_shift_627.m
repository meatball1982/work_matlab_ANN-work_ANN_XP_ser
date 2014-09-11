function [out,si,pre_shift]=fun_er_static_shift_627(re,si)

er_thred=3;

pre_shift=mean(si-re);
si=si-pre_shift;

n_re=length(re);

[ stat_out ] = fun_mm_stat_R2kb(re,si);
n_er=sum(abs(re-si)*627.2>er_thred);
n_er_rat=n_er/n_re;

[out]=[stat_out, n_er_rat, n_er, n_re];

%% logs 
% mod : 21-May-2014 10:29:10
% output pre_shift
function [out]=fun_er_static_V5(re,si,er_thred)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% er_thred=3;

% pre_shift=mean(si-re);
% si=si-pre_shift;

n_re=length(re(:));

[ stat_out ] = fun_mm_stat_R2kb(re(:),si(:));
er=abs(re(:)-si(:));
n_er=sum(er>er_thred);
n_er_rat=n_er/n_re;

mi_er=min(er);
ma_er=max(er);
st_er=std(er);


[out]=[stat_out, n_er_rat, n_er, n_re, mi_er, ma_er, st_er];

end

%% logs
% mod : 12-May-2014 14:29:24

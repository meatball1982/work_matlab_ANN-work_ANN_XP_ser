function [out]=fun_static_err_v4(re,si)

out(1,1:3)=fun_mm_stat_R2kb(re,si);

[tm_er]=fun_static_err_v3(re,si);

out(1,4)=tm_er.er_rel.stat.me;
out(1,5)=tm_er.er_rel.stat.ma;
out(1,6)=tm_er.er_rel.stat.mi;
out(1,7)=tm_er.er_rel.stat.st;
out(1,8)=tm_er.er_rel.V3.er_s5_r;
out(1,9)=tm_er.er_rel.V4.er_s01_r;

out=out';
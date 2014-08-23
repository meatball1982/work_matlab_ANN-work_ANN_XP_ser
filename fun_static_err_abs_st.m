function [me,ma,mi,st]=fun_static_err_abs_st(er);

me=mean(er);
ma=max(er);
mi=min(er);
st=std(er);


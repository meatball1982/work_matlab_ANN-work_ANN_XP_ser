function [hi_bi,hi_abs,hi_abs_rel]=fun_static_err_abs_hi(abs_er,be,en,hist_num);

n=length(abs_er);
hi_bi  = fun_gen_hist_bin(be,en,hist_num);
hi_abs = hist(abs_er,hi_bi);
hi_abs_rel=hi_abs/n;


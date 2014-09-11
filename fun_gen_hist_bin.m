function [hb]=fun_gen_hist_bin(be,en,n)

in=(en-be)/n;
hb=[(be+in/2):in:(en-in/2)]';
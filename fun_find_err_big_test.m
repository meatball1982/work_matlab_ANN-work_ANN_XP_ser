clear all
clc

re=rand(5,3)
pr=re+0.1*randn(5,3)

thred=0.1;

[ er_rat,ind ] = fun_find_err_big( re,pr,thred )


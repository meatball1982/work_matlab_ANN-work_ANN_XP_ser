clear all
clc

a=rand(10000,2);
% b=a+randn(10000,2)/100;
b=a+2;

densityplot(a,b,200,10)
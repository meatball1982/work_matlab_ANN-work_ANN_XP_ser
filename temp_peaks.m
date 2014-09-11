clear all
clc

[x,y,z]=peaks(40);

ind=x+y>2;
z(ind)=NaN;

mesh(x,y,z)
colorbar
view(70,54)
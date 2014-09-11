function [r,p]=fun_m_rsquare(x,y)

p = polyfit(x,y,1);
f = polyval(p,x);
[r rmse] = rsquare(y,f);
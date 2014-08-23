function [out]=fun_mm_hist2D(x,y,x_r,y_r)
% [out]=fun_mm_hist2D(x,y,x_r,y_r)
% 
% 二维的hist 函数，统计一组二维点在二维空间中的网格中出现的次数。
%
% example:
% xb=[0.5 1.5 2.5 3.5]'; yb=[0.3 0.9 1.5]';
% x_g=[xb-xb(1);xb(end)+xb(1)];y_g=[yb-yb(1);yb(end)+yb(1)];
% [X_g,Y_g]=meshgrid(x_g,y_g);
% x=rand(20,1).*4;y=rand(20,1).*1.8;x=[x;0],y=[y;0],
% clf;mesh(X_g,Y_g,zeros(size(X_g)));hold on
% x1=x;y1=y;plot(x1,y1,'.');view(0,90)
% [out1]=fun_mm_hist2D(x1,y1,x_g,y_g)
% x(2:3)=[];y(2:3)=[];x2=x;y2=y;
% [out2]=fun_mm_hist2D(x2,y2,x_g,y_g)
% plot(x2,y2,'ro')


x_n=length(x_r)-1;
% x_int05=x_r./(2*x_n);
% x_bi=[x_r(1:end-1)]+x_int05;

y_n=length(y_r)-1;
y_int05=y_r(end)./(2*y_n);
y_bi=y_r(1:y_n)+y_int05;

for i=1:x_n
    x_l=x_r(i);
    x_u=x_r(i+1);
    if i==1
        ind_cho=(x_l<=x)&(x<=x_u);
    else
        ind_cho=(x_l<x)&(x<=x_u);
    end
       tm=hist(y(ind_cho),y_bi);
       out(:,i)=tm;
end

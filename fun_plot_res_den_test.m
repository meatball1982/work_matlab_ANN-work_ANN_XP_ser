clear all
clc
clf

%% outline
% a density plot of the re and si


%% main part
load Mat_kfold_res_tmp.mat


% re=dat_En_tr;
% si=dat_En_va_final;

re=dat2160_En;
si=dat_En_va_2160;

% re=dat_En_va;
% si=dat_En_va_final;

pre_shift=mean(si-re);

si=si-pre_shift;

num_den=200;

dat=[re'; si']';
mi=min(dat(:));
mx=max(dat(:));

x_hi=linspace(mi,mx,num_den);
edge_hi{1}=x_hi';
edge_hi{2}=x_hi';
[X,Y]=meshgrid(x_hi,x_hi);

% [v,C]=hist3(dat,'Edges',edge_hi);

% v(v==0)=NaN;
subplot(1,2,1)
h=fun_plot_res_sqr(re,si,'en va ');
subplot(1,2,2)
[ hist_2d ] = fun_plot_res_den( re, si , num_den );


% % figure(1)
% subplot(2,2,1)
% pcolor(X',Y',v)
% shading flat
% axis equal
% axis([mi mx mi mx])
% colorbar
% hold on
% line([mi mx],[mi mx],'LineWidth',2,'Color',[0 0 0])
% grid on
% % [ hist_2d ] = fun_plot_res_den( re, si , num_den )
% 
% % figure(2)
% subplot(2,2,2)
% densityplot(re,si,200,10)
% line([mi mx],[mi mx],'LineWidth',2,'Color',[0 0 0])
% axis([mi mx mi mx])
% grid on
% 
% % figure(3)
% subplot(2,2,3)
% h=fun_plot_res_sqr(re,si,'en va ');
% 
% % figure(4)
% subplot(2,2,4)
% histmat  = hist2(re, si, x_hi, x_hi);
% histmat(histmat==0)=NaN;
% pcolor(X',Y',histmat)
% shading flat
% axis equal
% axis([mi mx mi mx])
% colorbar
% hold on
% line([mi mx],[mi mx],'LineWidth',2,'Color',[0 0 0])
% grid on


%% logs
% mod : 21-Apr-2014 16:45:57

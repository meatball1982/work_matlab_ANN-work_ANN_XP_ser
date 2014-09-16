clear all
clc

load Mat_016_cluster_3_20Dia_int.mat dat_En dat_in 

load Mat_int_name.mat

str_all=[bod_na;ang_na;dia_na];

x=dat_in(:,37);% 16H_13O_12C
y=dat_in(:,34);% 12O_12C_7C
z=dat_in(:,47);
% z=dat_in(:,48);% 7C_6N_1C_0C
% z(z<0)=z(z<0)+2*pi;

% plot3(x(1:10:end),y(1:10:end),dat_En(1:10:end),'.')
% grid on
% axis tight
% scatter3(x(1:10:end),y(1:10:end),z(1:10:end),20,dat_En(1:10:end));

n=length(dat_in(1,:));
% for i=1:(n-1)
%     for j=i+1:n
% for i=1:2
%     for j=(i+1):3
for i=23:(n-1)
    for j=i+1:n

        clf
        h=plot3(dat_in(1:10:end,i),dat_in(1:10:end,j),dat_En(1:10:end),'.')
        fi_na=['../imgs/en/27_int_dia_input_en/two_input_eng/fig_',mat2str(i),'_',mat2str(j)];
        axis tight
        xlabel(str_all{i});
        ylabel(str_all{j});
        title([mat2str(i),'-',mat2str(j)]);
        fun_work_li_035_myfig_out(h,fi_na,3);
    end
end

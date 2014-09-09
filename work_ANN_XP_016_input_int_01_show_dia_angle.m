clear all
close all
clc

%% outline
% find the main dia angle and plot the energy
%
load Mat_320_int_input_output54.mat


%% plot each dia
% b=dat320_in_noh(:,end-6:end);
% b(b<0)=b(b<0)+2*pi;
% ind_b3=b(:,3)<1.2;
% b(ind_b3,3)=b(ind_b3,3)+2*pi;
% ind_b6=b(:,6)>4.5;
% b(ind_b6,6)=b(ind_b6,6)-2*pi;
% 
% for i=1:7
% %         subplot(3,3,i)
% %     clf
%     c=dia_noh(i,:)-1;
%     dia_ind=[mat2str(c(1)),'-',mat2str(c(2)),'-',...
%         mat2str(c(3)),'-',mat2str(c(4))];
%     clf
%     h=plot(b(:,i),dat_En,'.')
%     title(dia_ind),'_',mat2str(c(4))
%     axis([min(b(:,i)) max(b(:,i)) 0 40])
%     fi_na=['../imgs/en/27_int_dia_input_en/dia_angle_dis/fig_dia_',...
%         mat2str(c(1)),'_',mat2str(c(2)),'_',...
%         mat2str(c(3)),'_',mat2str(c(4))]
%     fun_work_li_035_myfig_out(h,fi_na,3)
% end


%% plot angle
% b=dat320_in_noh(:,11:19);
% for i=1:9
%         subplot(3,3,i)
% %     clf
%     c=ang_noh(i,:)-1;
%     ang_ind=[mat2str(c(1)),'-',mat2str(c(2)),'-',...
%         mat2str(c(3))];
%     clf
%     h=plot(b(:,i),dat_En,'.')
%     title(ang_ind)
%     axis([min(b(:,i)) max(b(:,i)) 0 40])
%     fi_na=['../imgs/en/27_int_dia_input_en/angle_dis/fig_dia_',...
%         mat2str(c(1)),'_',mat2str(c(2)),'_',mat2str(c(3))];
%     fun_work_li_035_myfig_out(h,fi_na,3)
% end

%% plot bond
b=dat320_in_noh(:,1:10);
for i=1:10
%         subplot(3,3,i)
%     clf
    c=bod_noh(i,:)-1;
    bod_ind=[mat2str(c(1)),'-',mat2str(c(2))];
    clf
    h=plot(b(:,i),dat_En,'.')
    title(bod_ind)
    axis([min(b(:,i)) max(b(:,i)) 0 40])
    fi_na=['../imgs/en/27_int_dia_input_en/bond_dis/fig_dia_',...
        mat2str(c(1)),'_',mat2str(c(2))];
    fun_work_li_035_myfig_out(h,fi_na,3)
end

%% plot 2 main dia angles
% a=dat320_in_dia;
% 
% dia1=a(:,1);
% dia2=a(:,2);
% dia3=a(:,3);
% dia1(dia1<0)=dia1(dia1<0)+2*pi;
% dia2(dia2<0)=dia2(dia2<0)+2*pi;
% dia3(dia3<0)=dia3(dia3<0)+2*pi;
% h=scatter(dia1,dia3,20,dat_En)
% grid on
% axis tight
% colorbar
% xlabel('8-7-6-1'),ylabel('17-8-7-6')
% fi_na=['../imgs/en/27_int_dia_input_en/fig_dia_2D_scatter_En'];
% fun_work_li_035_myfig_out(h,fi_na,3)
    
%% plot 3 main dia angles
% a=dat320_in_dia;
% 
% dia1=a(:,1);
% dia2=a(:,2);
% dia3=a(:,3);
% dia1(dia1<0)=dia1(dia1<0)+2*pi;
% dia2(dia2<0)=dia2(dia2<0)+2*pi;
% dia3(dia3<0)=dia3(dia3<0)+2*pi;
% % ind_cho=dia1>2 & dia2<4;
% %
% ind_cho=logical([1:length(dat_En)]);
% h=scatter3(dia1(ind_cho),dia2(ind_cho),dia3(ind_cho),...
%     40,dat_En(ind_cho))
% axis tight
% colorbar
% view(110,15)
% xlabel('8-7-6-1'),ylabel('17-8-7-6'),zlabel('13-12-7-6')
% fi_na=['../imgs/en/27_int_dia_input_en/fig_dia_3D_scatter_En_13_12_7_6'];
% fun_work_li_035_myfig_out(h,fi_na,3)

% view(-5,10)
% xlabel('8-7-6-1'),ylabel('17-8-7-6'),zlabel('12-7-6-1')
% fi_na=['../imgs/en/27_int_dia_input_en/fig_dia_3D_scatter_En_12_7_6_1'];
% fun_work_li_035_myfig_out(h,fi_na,3)

%


% plot(dia1,dat_En,'.')
% scatter3(cos(dia1),cos(dia3),cos(dia2),20,dat_En)
% view(0,90)

%% logs
% mod on : 23-Aug-2014 14:22:00
% shift each dia angle

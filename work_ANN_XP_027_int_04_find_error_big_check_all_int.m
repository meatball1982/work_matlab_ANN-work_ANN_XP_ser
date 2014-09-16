clear all
clc
% clf

%% outline
% plot the all atom int
% find the out range points

%% load data
load Mat_016_cluster_3_20Dia_int.mat dat_En dat_in 
load Mat_find_err_big_near_ind.mat  ind_tr_320 en_er



% plot index and name
load Mat_int_name.mat

n_bod=length(bod_na);
n_ang=length(ang_na);
n_dia=length(dia_na);


dat_in_nr=dat_in(ind_tr_320,:);
dat_en_nr=dat_En(ind_tr_320);

ind_va_er=dat_En==en_er;
dat_in_va_er=dat_in(ind_va_er,:);


% find the outrange bod
ind_bod=1:n_bod;
out_str={};
con=1;
for i=1:n_bod
    arr_range = dat_in_nr(:,i);
    tar       = dat_in_va_er(i);
    [ flg, tar, mi, ma ] = fun_judge_in_range(arr_range, tar);
    if flg==0
        out_str{con}  = bod_na{i};
        out_ran(con,:)=[tar, mi,(mi+ma)/2 ma];
        con=con+1;
        
    end
end


% find the outrange ang
ind_ang=n_bod+1:n_bod+n_ang;    
tm1=dat_in_nr(:,ind_ang);
tm2=dat_in_va_er(ind_ang);

for i=1:n_ang
    arr_range = tm1(:,i);
    tar       = tm2(i);
    [ flg, tar, mi, ma ] = fun_judge_in_range(arr_range, tar);
    if flg==0
        out_str{con}  = ang_na{i};
        out_ran(con,:)=[tar, mi,(mi+ma)/2 ma];
        con=con+1;
    end
end

% find the outrange dia
ind_dia=n_bod+n_ang+1:n_bod+n_ang+n_dia;    
tm1=dat_in_nr(:,ind_dia);
tm2=dat_in_va_er(ind_dia);

for i=1:n_dia
    arr_range = tm1(:,i);
    tar       = tm2(i);
    [ flg, tar, mi, ma ] = fun_judge_in_range(arr_range, tar);
    if flg==0
        out_str{con}  = dia_na{i};
        out_ran(con,:)=[tar, mi,(mi+ma)/2 ma];
        con=con+1;
    end
end
% dia_na{logical(1-out_dia(:,1))}


% plot bond
% ind_bod=1:n_bod;
% h=plot(dat_in_nr(:,ind_bod)','bo-');
% hold on 
% plot(dat_in_va_er(ind_bod),'ro-');
% set(gca,'XTick',1:1:n_bod)
% set(gca,'XTickLabel',bod_na)
% rotateXLabels( gca, -90 )
% 
% fi_na=['../imgs/en/27_int_dia_input_en/find_err_big_all_int/fig_feb_all_int_01_bod'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% plot  angle
% ind_ang=n_bod+1:n_bod+n_ang;
% h=plot(dat_in_nr(:,ind_ang)','bo-');
% hold on 
% plot(dat_in_va_er(ind_ang),'ro-');
% set(gca,'XTick',1:1:n_ang)
% set(gca,'XTickLabel',ang_na)
% rotateXLabels( gca, -90 )
% axis([0 23 1.7 2.35])
% fi_na=['../imgs/en/27_int_dia_input_en/find_err_big_all_int/fig_feb_all_int_02_ang'];
% fun_work_li_035_myfig_out(h,fi_na,3);

% plot dia
% ind_dia=n_bod+n_ang+1:n_bod+n_ang+n_dia;
% h=plot(dat_in_nr(:,ind_dia)','bo-');
% hold on 
% plot(dat_in_va_er(ind_dia),'ro-');
% set(gca,'XTick',1:1:n_dia)
% set(gca,'XTickLabel',dia_na)
% rotateXLabels( gca, -90 )
% % axis([0 23 1.7 2.35])
% fi_na=['../imgs/en/27_int_dia_input_en/find_err_big_all_int/fig_feb_all_int_03_dia'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% logs 
% mod : 12-Sep-2014 22:12:22
% gen mod gaussian input data
% mod : 12-Sep-2014 16:01:16
% mod : 12-Sep-2014 10:02:00
% mod : 11-Sep-2014 20:32:53
% mod : 08-Sep-2014 15:21:01

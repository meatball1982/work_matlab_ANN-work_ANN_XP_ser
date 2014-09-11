function [er_stat]=fun_static_err_v3(re,si);
% to static the error

%% para
hist_num=40;

%% cal
n=length(re);
% abs error
Er_er     = re-si;

%% abs error
Er_abs_er = abs(Er_er);
[Er_abs_me,Er_abs_ma,Er_abs_mi,Er_abs_st]=fun_static_err_abs_st(Er_abs_er);

[hi_bi0,hi_ab_0,hi_ab_r_0]=fun_static_err_abs_hi(Er_abs_er,0,max(Er_abs_er),hist_num);
[hi_bi1,hi_ab_1,hi_ab_r_1]=fun_static_err_abs_hi(Er_abs_er,0,1,   hist_num);
[hi_bi2,hi_ab_2,hi_ab_r_2]=fun_static_err_abs_hi(Er_abs_er,0,0.1, hist_num);
[hi_bi3,hi_ab_3,hi_ab_r_3]=fun_static_err_abs_hi(Er_abs_er,0,0.03,hist_num);

%% rel error
% real value is 0
Er_re_0_ind=(re==0);
Er_re_0_n=sum(re==0);
Er_re_0_r=Er_re_0_n/n;

si_n0=si(~Er_re_0_ind);
re_n0=re(~Er_re_0_ind);

%if  the real value is not 0, the relative err. else the relative error is
%0.% modified on : 17-Dec-2012 09:44:35
Er_rel_er(~Er_re_0_ind)=abs((si_n0-re_n0)./re_n0);
Er_rel_er(Er_re_0_ind)=0;
[Er_rel_me,Er_rel_ma,Er_rel_mi,Er_rel_st]=fun_static_err_abs_st(Er_rel_er);

% relative error larger than 1
er_L1_ind= (Er_rel_er>=1)';
er_L1_n  = sum(er_L1_ind);
er_L1_r  = er_L1_n/n;

% real value is small
er_re_S001_ind=((0<abs(re))&(abs(re)<=0.01)); % real value~=0, real value<=0.01
er_re_L001_ind=             (abs(re)> 0.01) ; % re >0.01.

% % to test wether the index are equal. mod : 25-Dec-2012 18:56:48
% sum(er_re_S001_ind)+...
% sum(er_re_L001_ind)+...
% Er_re_0_n

er_01_del_ind=(er_re_S001_ind &   er_L1_ind                  ); % real value <0.01, rel err >1. should be deleted
er_02_lef_ind=(er_re_L001_ind &   er_L1_ind                  ); % left points
er_03_lef_ind=(er_re_S001_ind & (~er_L1_ind) & (~Er_re_0_ind)); % real value< 0.01, rel err <=1, real value ~=0;
er_04_lef_ind=(er_re_L001_ind & (~er_L1_ind) & (~Er_re_0_ind)); % real value>=0.01,rel err <=1, real value ~=0;

er_01_del_n=sum(er_01_del_ind);
er_02_lef_n=sum(er_02_lef_ind);
er_03_lef_n=sum(er_03_lef_ind);
er_04_lef_n=sum(er_04_lef_ind);

n_del=n-er_01_del_n;
Er_re_0_r_d=Er_re_0_n/n_del;

% 0< relative error <1
er_m01_ind=~(Er_re_0_ind) & ~(er_L1_ind);% real is not 0, rel <=1
er_m01_n  = sum(er_m01_ind);
er_m01_r  = er_m01_n/n;
er_m01_r_d= er_m01_n/n_del;

% relative error <0.05
er_s5_ind = (Er_rel_er<=0.05);
er_s5_n   = sum(er_s5_ind);
er_s5_r   = er_s5_n/n;
er_s5_r_d = er_s5_n/n_del;

er_s01_ind = (Er_rel_er<=0.1);
er_s01_n   = sum(er_s01_ind);
er_s01_r   = er_s01_n/n;
er_s01_r_d = er_s01_n/n_del;


er_01_del_r=er_01_del_n/n;
er_02_lef_r=er_02_lef_n/n;
er_03_lef_r=er_03_lef_n/n;
er_04_lef_r=er_04_lef_n/n;

er_01_del_r_d=er_01_del_n/n_del;
er_02_lef_r_d=er_02_lef_n/n_del;
er_03_lef_r_d=er_03_lef_n/n_del;
er_04_lef_r_d=er_04_lef_n/n_del;


% rel hist 
[hi_bi0_rel,hi_ab_0_rel,hi_ab_r_0_rel]=...
                fun_static_err_abs_hi(Er_rel_er,0,max(Er_rel_er),hist_num);
[hi_bi1_rel,hi_ab_1_rel,hi_ab_r_1_rel]=...
                fun_static_err_abs_hi(Er_rel_er,0,1,   hist_num);
[hi_bi2_rel,hi_ab_2_rel,hi_ab_r_2_rel]=...
                fun_static_err_abs_hi(Er_rel_er,0,0.1, hist_num);
[hi_bi3_rel,hi_ab_3_rel,hi_ab_r_3_rel]=...
                fun_static_err_abs_hi(Er_rel_er,0,0.03,hist_num);

% sign error static % mod: 16-Feb-2013 09:37:14
[sign_er_stat]=fun_static_err_sig(re,si);

% the r-square and the parameters of the y=ax+b;
[en_r,en_p]=fun_m_rsquare(re,si);

%% output
% er
er_stat.ervalue.Er_er     = Er_er;

% abs error
er_stat.er_abs.Er_abs_er  = Er_abs_er;
er_stat.er_abs.stat.me    = Er_abs_me;
er_stat.er_abs.stat.ma    = Er_abs_ma;
er_stat.er_abs.stat.mi    = Er_abs_mi;
er_stat.er_abs.stat.st    = Er_abs_st;

er_stat.er_abs.H0.hi_bi    = hi_bi0;
er_stat.er_abs.H0.hi_ab    = hi_ab_0';
er_stat.er_abs.H0.hi_ab_r  = hi_ab_r_0';

er_stat.er_abs.H1.hi_bi    = hi_bi1;
er_stat.er_abs.H1.hi_ab    = hi_ab_1';
er_stat.er_abs.H1.hi_ab_r  = hi_ab_r_1';

er_stat.er_abs.H2.hi_bi    = hi_bi2;
er_stat.er_abs.H2.hi_ab    = hi_ab_2';
er_stat.er_abs.H2.hi_ab_r  = hi_ab_r_2';

er_stat.er_abs.H3.hi_bi    = hi_bi3;
er_stat.er_abs.H3.hi_ab    = hi_ab_3';
er_stat.er_abs.H3.hi_ab_r  = hi_ab_r_3';

% rel error
er_stat.er_rel.Er_rel_er  = Er_rel_er';
er_stat.er_rel.stat.me         = Er_rel_me;
er_stat.er_rel.stat.ma         = Er_rel_ma;
er_stat.er_rel.stat.mi         = Er_rel_mi;
er_stat.er_rel.stat.st         = Er_rel_st;

% rel value
er_stat.er_rel.V0.Er_re_0_ind=Er_re_0_ind;
er_stat.er_rel.V0.Er_re_0_n  =Er_re_0_n;
er_stat.er_rel.V0.Er_re_0_r  =Er_re_0_r;
er_stat.er_rel.V0.Er_re_0_r_d=Er_re_0_r_d;

er_stat.er_rel.V1.er_L1_ind = er_L1_ind;
er_stat.er_rel.V1.er_L1_n   = er_L1_n;
er_stat.er_rel.V1.er_L1_r   = er_L1_r;

er_stat.er_rel.V2.er_m01_ind = er_m01_ind;
er_stat.er_rel.V2.er_m01_n   = er_m01_n;
er_stat.er_rel.V2.er_m01_r   = er_m01_r;
er_stat.er_rel.V2.er_m01_r_d = er_m01_r_d;

er_stat.er_rel.V3.er_s5_ind  = er_s5_ind;
er_stat.er_rel.V3.er_s5_n    = er_s5_n;
er_stat.er_rel.V3.er_s5_r    = er_s5_r;
er_stat.er_rel.V3.er_s5_r_d  = er_s5_r_d;

er_stat.er_rel.V4.er_s01_ind  = er_s01_ind;
er_stat.er_rel.V4.er_s01_n    = er_s01_n;
er_stat.er_rel.V4.er_s01_r    = er_s01_r;
er_stat.er_rel.V4.er_s01_r_d  = er_s01_r_d;

% rel hist
er_stat.er_rel.H0.hi_bi_rel    = hi_bi0_rel;
er_stat.er_rel.H0.hi_ab_rel    = hi_ab_0_rel';
er_stat.er_rel.H0.hi_ab_r_rel  = hi_ab_r_0_rel';

er_stat.er_rel.H1.hi_bi_rel    = hi_bi1_rel;
er_stat.er_rel.H1.hi_ab_rel    = hi_ab_1_rel';
er_stat.er_rel.H1.hi_ab_r_rel  = hi_ab_r_1_rel';

er_stat.er_rel.H2.hi_bi_rel    = hi_bi2_rel;
er_stat.er_rel.H2.hi_ab_rel    = hi_ab_2_rel';
er_stat.er_rel.H2.hi_ab_r_rel  = hi_ab_r_2_rel';

er_stat.er_rel.H3.hi_bi_rel    = hi_bi3_rel;
er_stat.er_rel.H3.hi_ab_rel    = hi_ab_3_rel';
er_stat.er_rel.H3.hi_ab_r_rel  = hi_ab_r_3_rel';

er_stat.er_rel.er_01_del.ind = er_01_del_ind;
er_stat.er_rel.er_02_lef.ind = er_02_lef_ind;
er_stat.er_rel.er_03_lef.ind = er_03_lef_ind;
er_stat.er_rel.er_04_lef.ind = er_04_lef_ind;

er_stat.er_rel.er_01_del.n   = er_01_del_n;
er_stat.er_rel.er_02_lef.n   = er_02_lef_n;
er_stat.er_rel.er_03_lef.n   = er_03_lef_n;
er_stat.er_rel.er_04_lef.n   = er_04_lef_n;

er_stat.er_rel.er_01_del.r   = er_01_del_r;
er_stat.er_rel.er_02_lef.r   = er_02_lef_r;
er_stat.er_rel.er_03_lef.r   = er_03_lef_r;
er_stat.er_rel.er_04_lef.r   = er_04_lef_r;

er_stat.er_rel.er_01_del.r_d   = er_01_del_r_d;
er_stat.er_rel.er_02_lef.r_d   = er_02_lef_r_d;
er_stat.er_rel.er_03_lef.r_d   = er_03_lef_r_d;
er_stat.er_rel.er_04_lef.r_d   = er_04_lef_r_d;

er_stat.er_rel.sign_er_stat    =sign_er_stat;

er_stat.val_rel.r=en_r;
er_stat.val_rel.para=en_p;


%% logs
% modified on : 20-Mar-2013 18:37:13
% 将相关系数和y=ax+b的系数加入到输出当中。
% er_stat.val_rel.r and er_stat.val_rel.para

% modified on : 16-Feb-2013 09:35:25
% 将符号统计的函数加入到误差统计的程序。

% modified on : 13-Feb-2013 12:52:16
% 因为四极的数值比较小，所以统计预测的正负号是否正确占总数的比例。

% modified on : 27-Dec-2012 10:17:39
% the ratio of each  para of the n-n_del

% modified on : 25-Dec-2012 19:43:14
% add the ratio.

% modified on : 25-Dec-2012 16:08:17
% static the rel error big, real value small points.

% modified on : 08-Dec-2012 18:14:56
% finish the error static function.

% modified on : 13-Nov-2012 14:17:02
% 
% modified on : 12-Nov-2012 17:54:34
% typed by    : m

%% rub files
% er=abs((re-si)./re); % abs(relative error)
% er(er==inf)=0;       % if the error ==inf, error =0;
% er(er>1)=1;          % if the error >1, error =1
% er=er(:)';           % reshape the matrix into vector
% [h_val]=hist(er,bi); % hist the error in bi interval
% Num=length(re(:));   % the number of re
% h_val=h_val./Num;    % the relative hist
% % h_ind=bi;            % for output.
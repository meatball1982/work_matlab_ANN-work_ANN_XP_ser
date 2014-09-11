function [rat_sig]=fun_static_err_sig(re,si)
% 统计符号相同的数据占总数据的比例。
ind_n0=re~=0;
Er_rel=zeros(size(re));
Er_rel(ind_n0)=abs((re(ind_n0)-si(ind_n0))./re(ind_n0));
sig_ind=zeros(size(re));
sig_ind(re~=0)=sign(re(re~=0).*si(re~=0));

Er_rel_sig=Er_rel.*sig_ind;
n_sig=sum(sum(sig_ind>=0));

for i=1:20
    rat=i*0.05;
    ind_rat=Er_rel<rat;
    rat_sig(i)=sum(ind_rat(:))/n_sig;
end
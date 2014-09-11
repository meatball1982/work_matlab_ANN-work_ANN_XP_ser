function [ out ] = fun_mm_stat_R2kb(re,si)
% 
% 
R2=(corr2(re(:),si(:))).^2;
kb_pr=polyfit(re(:),si(:),1);

out(1)=R2;
out(2)=kb_pr(1);
out(3)=kb_pr(2);

end


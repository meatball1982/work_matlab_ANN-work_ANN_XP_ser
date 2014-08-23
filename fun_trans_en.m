function [en_new]=fun_trans_en(en,flg)
% [en_new]=fun_trans_en(en)
% mod : 20-Mar-2013 18:10:15
% gen the new en value
% 
% if flg ==  1, en *637 +357397
% if flg == -1, (en - 357397)/637
% if flg == others en

en_shift=357397;
en_mul=627.50956;

if flg==1
    en_new=en*en_mul+en_shift;
elseif flg==-1
    en_new=(en-en_shift)/en_mul;
else
    en_new=en;
end

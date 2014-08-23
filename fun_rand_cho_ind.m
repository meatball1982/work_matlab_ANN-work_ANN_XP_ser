function [ind01,ind02] = fun_rand_cho_ind(n_all,n_part)
% [ind01,ind02] = fun_rand_cho_ind(n_all,n_part)
% 
% mod : 08-Mar-2014 19:34:57


t_tmp = randperm(n_all);
ind01 = sort(t_tmp( 1        :n_part));
ind02 = sort(t_tmp((n_part+1):end   ));

end


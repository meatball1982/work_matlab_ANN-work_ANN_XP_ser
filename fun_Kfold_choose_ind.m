function [ind_mat]=fun_Kfold_choose_ind(ind_ori,k)
% [ind_mat]=fun_Kfold_choose_ind(ind_ori,k)

%% main part
m=length(ind_ori);
n_clu=floor(m/k);   % the number of each fold 

t_tmp=randperm(m);

% chose each index from all data.
for i=1:k
    le=length(ind_ori);
    t_tmp=randperm(le);
    cho=t_tmp(1:n_clu);
    ind_mat(i,:)=ind_ori(cho);
    ind_ori(cho)=[];
end


%% logs 
% mod : 28-Feb-2014 10:14:36
% 
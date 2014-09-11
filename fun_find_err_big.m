function [ er_rat,ind ] = fun_find_err_big( re,pr,thred )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% old version
% er     = abs(re-pr);
% ind    = max(er') > thred;
% er_rat = sum(ind)/length(re(:,1));

%% new version
er      = abs(re-pr);
ind_mat = (er) > thred;
er_rat  = sum(ind_mat(:))/length(re(:));
ind     = max(ind_mat');

end

% mod : 06-May-2014 15:28:47

function [ flg_in, tar_el,mi_range, ma_range ] = fun_judge_in_range(arr_range, tar_el )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

mi_range = min(arr_range);
ma_range = max(arr_range);

flg_in = tar_el>= mi_range && tar_el <=ma_range;


% mod : 12-Sep-2014 16:40:19
% 


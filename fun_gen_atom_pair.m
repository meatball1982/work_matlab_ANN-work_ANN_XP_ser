function [out_str]=fun_gen_atom_pair(in_cell);

out_str = [ mat2str(in_cell{1,1}), in_cell{1,2}, ...
            mat2str(in_cell{1,3}), in_cell{1,4}];
clear all
clc

%% 
n_per=1;
n_rep=1;
n_ite=5;

for k=1:n_per
    
     tr_rat=0.80;                % train percents
     tr_rat_str=mat2str(100*tr_rat);

    
    for i=1:n_rep
        for ite=1:n_ite
            ite
            nnt_epochs_en = 30000+ite*10000;
            fi_na=['../res_data/en/en_atom_int_cluster/n118/Mat_atom_int_cluster_3_20Dia_trper',...
             tr_rat_str,'_ite_',mat2str(nnt_epochs_en),'_rep_',mat2str(i),'_notrans.mat'];
            load(fi_na);
            R2KB_tr_mat(ite,:)=[er_tr_en.val_rel.r,er_tr_en.val_rel.para(1),er_tr_en.val_rel.para(2)];
            R2KB_si_mat(ite,:)=[er_si_en.val_rel.r,er_si_en.val_rel.para(1),er_si_en.val_rel.para(2)];
        end
    end
end
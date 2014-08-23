%% flowchart %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% while  ~flg_whi_true    
%     % predict validation set and seperate accepted Ser and unaccepted Ser
%     % del unaccepted Ser in validation set.
%     if er_rat > Er_rat_max
%        % suc_con=0; 
%        % add ( err ser ) into loop training set
%        % k-fold mod train ann 
%        % add 500 ser from 21-60MDser into validation set    
%     else
%         if suc_ite < suc_con_max
%             % suc_con = suc_con + 1 ;
%             % choose  500 ser from 21-60 ser to validation set
%         else
%             % output final trained ann
%             flg_train_suc=1;
%             break;
%         end
%     end
%     % calculate er_rat
%     % calculate n_len_2160
%     if n_len_2160 < n_val_new
%         flg_train_suc=0;
%         break;
%     end
% end

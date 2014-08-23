function [h]=fun_plot_stat(stat,n_fil,n_rep,x_tick_lab,pre_fix,flg)

x_tick     =[1:n_fil]; 
for k=1:n_fil
    for j=1:n_rep
    er_V05(k,j)=stat(k,j).V3.er_s5_r_d;
    er_V10(k,j)=stat(k,j).V4.er_s01_r_d;
    end
end


hold on
x_ind=[1:n_rep];

if flg==5
    for i=1:n_fil
        h=plot(i*ones(size(x_ind)),er_V05(i,:),'o','MarkerEdgeColor','r',...
            'MarkerFaceColor','b','MarkerSize',6);
    end
    
    y_mi=0.98*min(er_V05(:));
    y_ma=1.02*max(er_V05(:));
    
    axis([0 n_fil+1 y_mi y_ma])
    h_a=gca;grid on
    set(h_a,'XTick',x_tick),set(gca,'XTickLabel',x_tick_lab)
    xlabel('train ratio'),ylabel([pre_fix,' er rel S05'])
    title(['si er ',pre_fix,' rel 5per rat'])
elseif flg==10
    for i=1:n_fil
        h=plot(i*ones(size(x_ind)),er_V10(i,:),'o','MarkerEdgeColor','k',...
            'MarkerFaceColor','g','MarkerSize',6);
    end
    
    y_mi=0.98*min(er_V10(:));
    y_ma=1.02*max(er_V10(:));
    
    axis([0 n_fil+1 y_mi y_ma])
    h_a=gca;grid on
    set(h_a,'XTick',x_tick),set(gca,'XTickLabel',x_tick_lab)
    xlabel('train ratio'),ylabel([pre_fix,' er rel S10'])
    title(['si er ',pre_fix,' rel 10per rat'])
    
end
close all
clear all
clc
clf



%% mesh plot the refine 2 var angles via energy
% 

da=load('../data/ANN_input_out_file_find_err/out_eng_mesh.txt');
x_ran=load('../data/ANN_input_out_file_find_err/range_16H_13O_12C');
y_ran=load('../data/ANN_input_out_file_find_err/range_13O_12C_7C');

[X,Y]=meshgrid(x_ran,y_ran);

for i=1:10
    for j=1:10
        ind=da(:,1)==i & da(:,2)==j;
        da_mat(i,j)=da(ind,3);
    end
end

h=surf(X,Y,da_mat);
h=gcf;
axis tight
% shading interp
% xlabel('16H\_13O\_12C')
% ylabel('13O\_12C\_7C')
view(-140,10)
set(gcf, 'Renderer', 'zbuffer');

% fi_na_png=['../imgs/en/27_int_dia_input_en/mod_angs_eng/fig_mod_angs_energy.png'];
% export_fig(fi_na_png,gcf,'-png');


% [x,y,z]=peaks(30);
% 
% h=surf(x,y,z)
% fi_na_png=['../imgs/en/27_int_dia_input_en/mod_angs_eng/fig_mod_angs_energy.png'];
% export_fig(fi_na_png,gcf,'-png');

% fi_na=['../imgs/en/27_int_dia_input_en/mod_angs_eng/fig_mod_angs_energy'];
fi_na=['../imgs/en/27_int_dia_input_en/mod_angs_eng/fig_mod_tm'];
% fun_work_li_035_myfig_out(h,fi_na,3);

%% logs
% mod : 15-Sep-2014 08:59:15
% mod : 15-Sep-2014 17:25:29


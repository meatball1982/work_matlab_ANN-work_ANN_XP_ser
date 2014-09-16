clear all
clc

[x,y,z]=peaks(30);

h=surf(x,y,z)
set(gcf, 'Renderer', 'zbuffer');
fi_na_png=['../imgs/en/27_int_dia_input_en/mod_angs_eng/fig_mod_angs_energy.png'];
export_fig(fi_na_png,gcf,'-png');


% axis tight
% shading interp
% xlabel('16H\_13O\_12C')
% ylabel('13O\_12C\_7C')
% view(-140,10)

% fi_na=['../imgs/en/27_int_dia_input_en/mod_angs_eng/fig_mod_angs_energy'];
% fun_work_li_035_myfig_out(h,fi_na,3);
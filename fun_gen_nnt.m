function net0=fun_gen_nnt(P,n_in,n_out);
net0         = newff(minmax(P),[n_in,n_out],{'tansig','purelin'},'trainoss');
inputWeights = net0.IW{1,1};
inputbias    = net0.b{1};
layerWeights = net0.LW{2,1};
layerbias    = net0.b{2};


voltage_threshold = 0;
%functions for m,n,h

am = @(v) -0.1 * (40 + v) / (exp(-0.1*(40+ v)) - 1);
bm = @(v) 4 * exp(-(65 + v)/18);

ah = @(v) 0.07 * exp(-(65 + v)/20);
bh = @(v) 1./(exp(-(35 + v)/10) + 1);

an = @(v) 0.01 * (-(55 + v)) / (exp(-0.1*(55 + v)) - 1);
bn = @(v) 0.125 * exp(-(65+ v)/80);

as = @(v) (1 + tanh(v - voltage_threshold))/2;
bs = 0.18;

% const values
gNa = 120;
gk = 36;
gl = 0.3;
Ena = 50;
Ek = -77;
El = -54.4;
C = 1;


% Network parametr

nNeurons = 10;
E_inh = -80;
E_exc = 0;

%N_inh = 0.2*nNeurons;
N_inh = 0;
%N_exc = 0.8*nNeurons;
N_exc = nNeurons - N_inh;

% Gmax = 10;
% g = randn(nNeurons,nNeurons)/nNeurons*Gmax;

% g = randi([2 7],nNeurons,nNeurons)./100;
g = 0.02*ones(nNeurons);

g(:,1:N_inh)        = -abs(g(:,1:N_inh));
g(:,N_inh+1:end)    = abs(g(:,N_inh+1:end));
g(eye(nNeurons)==1) = 0;

Esyn = zeros(nNeurons,1);
Esyn(1:N_inh)     = -80;
Esyn(N_inh+1:end) = 0;


v = zeros(nNeurons,nTimePoints);
n = zeros(nNeurons,nTimePoints);
m = zeros(nNeurons,nTimePoints);
h = zeros(nNeurons,nTimePoints);

h(:,1) = random('uniform',0,1,[nNeurons,1]);
n(:,1) = random('uniform',0,1,[nNeurons,1]);
m(:,1) = random('uniform',0,1,[nNeurons,1]);
v(:,1) = -67;%random('uniform',-70,0,[nNeurons,1]);
h0(:,1)=h(:,1);m0(:,1)=m(:,1);n0(:,1)=n(:,1);v0(:,1)=v(:,1);

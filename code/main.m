clc
clear
close all
defineHodgkinHuxleyNueron;
%run parameter
dt                  = 0.01;
tmax                = 250;
t                   = 0:dt:tmax; %spiking duration
nTimePoints         = numel(t); %monitoring voltage of points
L1=15; % first spike location
L2=L1+1; % second spike location

defineHodgkinHuxleyNetwork;

injectedCurrent       = 12;
exterainjectedCurrent = 1;
pulseAmp              = 2;
pulseWidth            = 2/dt;
perturbedNeouronIdx   = 1;

runHodgkinHuxleyNetwork;
T0 = zeros(nNeurons,1);

for i = 1:nNeurons
    locs = find(rho1(i,:));
    T0(i)=locs(L2)-locs(L1); %period between first and second spike
    prct0(i)=locs(L2+1);
end

T          = T0(perturbedNeouronIdx);
startIx    = L1;
locs = find(rho1(perturbedNeouronIdx,:));
start      = locs(startIx);
phaseVals = linspace(0,T,30);
PR         = zeros(nNeurons, length(phaseVals));

for s     = 1:length(phaseVals)
    phase = ceil(phaseVals(s));
    runHodgkinHuxleyNetworkWithPerturbation;
    for i = 1:nNeurons
        locs    = find(rho2(i,:));        
        prct1(i) = locs(L2+1);
        PR(i,s)     = dt*(prct0(i)-prct1(i));
    end
end

%plot prc of neurons
figure; hold on;
for kk = 1:nNeurons
    plot(phaseVals/max(phaseVals),PR(kk,:));
    legn{kk}=['Neuron_',num2str(kk)];
end
legend(legn);

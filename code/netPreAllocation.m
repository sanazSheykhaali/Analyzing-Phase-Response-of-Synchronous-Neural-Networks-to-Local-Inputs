
%prealocating

% v = zeros(nNeurons,nTimePoints);
% n = zeros(nNeurons,nTimePoints);
% m = zeros(nNeurons,nTimePoints);
% h = zeros(nNeurons,nTimePoints);

%initial values
 h(:,1)=h0;n(:,1)=n0;m(:,1)=m0;v(:,1)=v0;
 S = zeros(nNeurons,nNeurons,nTimePoints);
SpikeTimes = zeros(nNeurons,nTimePoints);

% % SpikeTimes = zeros(nNeurons,nTimePoints);

% vtemp = zeros(nNeurons,nTimePoints);



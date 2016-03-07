
% Run CSMA Test
lambda = 30;
threshold = 0.01;
alpha = 4;
mu = 1;
d = 2;
enablePlot = true;

% Simulate snapshot of CSMA
[pproc,enabled] = SimulateCSMA(lambda,threshold,alpha,mu,d,enablePlot);
distances = GetDistanceDistribution(pproc, enabled);

% Pull out enables transmitters
transmitters = pproc(enabled>0,:);
figure(2);
scatter(transmitters(:,1),transmitters(:,2))

% Plot PDF
bins = 1000;
xbins = linspace(0,max(distances),bins);
histories = hist(distances,xbins);
normal = histories./sum(histories);
figure(3);
bar(xbins,normal);
title('PDF of TX distances');
xlabel('Point Distances');
 



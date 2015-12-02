% Plot Throughput single domain

T = @(lambda) lambda.*exp(-lambda);

lambda = 0:0.1:10;
y= linspace(0,0.4,length(lambda));

plot(lambda,T(lambda),ones(size(lambda)),y);
xlabel('\lambda_{sa}');
ylabel('T_{sa}^{sd}');
set(gca,'XTick',[1:10]) 
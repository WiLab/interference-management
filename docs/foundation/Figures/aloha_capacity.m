

u = 1; N=0; P=1; tau = 5;

TP = @(lambda) lambda.*(1-...
    (2*normcdf(...
    ...
    lambda.*pi*sqrt( (pi/2)/(u^(-4)/tau - N/P))...
    ...
    ,0,1)-1));

lambda = 0:0.01:5;
p_tx = 0.1:0.1:0.5;
d = [];
for x=1:length(p_tx)
    d = [d;TP(lambda*p_tx(x))];
end

% Plot
plot(lambda,d);str={};
for x=1:length(p_tx)
    str = {str{:},['p_{tx}=',num2str(p_tx(x))]};
end
legend(str{:});

xlabel('\lambda_{sc}');
ylabel('Throughput');
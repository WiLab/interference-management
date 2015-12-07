%% Probability of Success | Rayleigh Fading

p = 1;           % Transmit probability
lambda = 1/20;   % Network Density
alpha = 4;       % Pathloss exponent
d = 2;           % Dimension of system
c_d = pi;        % Volume of d dimensional ball
r = 1;           % Receiver distance from transmitter
delta = 2/alpha; % Pathloss dimension relation

thetasdB = (-10:0.1:15).';% SINR threshold
thetas = 10.^(thetasdB/10);

%% Aloha
ps_aloha = exp(-p*lambda*c_d*r^d*   pi*delta/sin(pi*delta)   .*thetas.^delta);

%% CSMA
%ro = 2;
s = thetas.*r^alpha;

ps_csma =@(ro) exp(-lambda*c_d.*sqrt(s).*(pi/2 - atan(1./sqrt(s.*ro.^(-alpha))) + sqrt(s.*ro^(-alpha))./(s.*ro^(-alpha)+1)) + lambda*c_d*ro^d.*s./(s+ro^alpha));

%%%%%%%%%%%%%%%%%%%%

A = -lambda*c_d.*sqrt(s);

B = atan(1./sqrt(s*ro.^(-alpha)));
C = sqrt(s.*ro^(-alpha))./(s.*ro^(-alpha)+1);
D = (pi/2 - B + C);

E = lambda*c_d*ro^d.*s./(s+ro^alpha);

ps_csma2 = exp(A.*D + E);


%% Plots
semilogy(thetasdB,ps_aloha,thetasdB,ps_csma(1/2),thetasdB,ps_csma(1),thetasdB,ps_csma(2));
xlabel('\theta [dB]');
ylabel('p_s(\theta)');
grid on;
legend('Aloha','CSMA \rho=1/2','CSMA \rho=1','CSMA \rho=2');

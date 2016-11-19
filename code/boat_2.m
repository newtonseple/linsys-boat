% Assume psi_w exists

%% 5.2a - find Pxx estimate
psi_w_data = psi_w(2,:);                     % Load data
psi_w_data = psi_w_data * pi / 180;          % Convert data to radians
[pxx, f] = pwelch(psi_w_data,4096,[],[],10); % Estimate Pxx
pxx = pxx / (2*pi);                          % Convert Pxx
f = f*2*pi;
hold off
plot(f,pxx);
hold on
%% 5.2c - find omega_0

[pxx_max,omega_0_ind]=max(pxx)
omega_0 = f(omega_0_ind)
% Result: omega_0 = 0.7823

%% 5.2d - find lambda
sigma = sqrt(pxx_max);
lambda_0 = 1; % past: 0.27 Initial guess lambda
% l is lambda, o is omega
K_w = @(l) 2*l*omega_0*sigma
%PSD = @(l, xdata) arrayfun(@(o) ((2*l*omega_0*sigma*o)^2/((omega_0^2 - o^2)^2+(2*l*omega_0*o)^2))^2 ,xdata)
PSD = @(l, xdata) arrayfun(@(o) ((K_w(l))^2 * o^2 / (o^4 + 2*omega_0^2 * (2*l^2 - 1) * o^2 + omega_0^4)) ,xdata)

lambda = lsqcurvefit(PSD,lambda_0,f,pxx)

plot (f,PSD(lambda,f))

% Result: lambda = 0.0827

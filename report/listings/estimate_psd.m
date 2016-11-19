%% 2a - find Pxx estimate
psi_w_data = psi_w(2,:);                     % Load data
psi_w_data = psi_w_data * pi / 180;          % Convert data to radians
[pxx, f] = pwelch(psi_w_data,4096,[],[],10); % Estimate Pxx
pxx = pxx / (2*pi);                          % Convert Pxx to s/rad
f = f*2*pi;                                  % Convert frequencies to rad/s

%% 2c - find omega_0
[pxx_max,omega_0_ind]=max(pxx)               % Find maximum frequency index
omega_0 = f(omega_0_ind)                     % Extract said frequency

%% 2d - find lambda
sigma = sqrt(pxx_max);                       % Sigma is needed in PSD
lambda_0 = 1;                                % Initial guess for lambda

% PSD function (o is omega, l is lambda)
PSD = @(l, xdata) arrayfun(@(o) (2*l*omega_0*sigma)^2 * o^2 / (o^4 + 2*omega_0^2 * (2*l^2 - 1) * o^2 + omega_0^4)) ,xdata)

lambda = lsqcurvefit(PSD,lambda_0,f,pxx)     % Estimate lambda by fitting PSD to the Welch estimate from 2a
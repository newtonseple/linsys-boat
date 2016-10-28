%% Setup

%% Simulation
sim ship

%% Plot
plot(phi_out.time, phi_out.data, 'k', phi_mod_out.time, phi_mod_out.data, 'b')
grid on
ylabel('phi')
xlabel('t')
legend('Boat', 'Model')
hold on

%% Data crunching
data = phi_out.data;
half = 3000;
data_after_transient = data(half:end);

top = max(data_after_transient)
bot = min(data_after_transient)
(top-bot) / 2

%% Results
% 1b)
% with omega 0.005
    % bot 5.0213
    % top 68.9787
    % amplitude 31.9787
% with omega 0.05
    % top 4.4847
    % bot 2.9153
    % amplitude 0.7847
% Nomoto constants:
% K = 0.1742
% T = 86.5246
% (solved using MATLAB)
%
% 1c) NO. Noise bad, cannot see. Maybe, but would need good filter.
% 
%%
w1 = 0.005;
w2 = 0.05;
a1 = 31.9787;
a2 = 0.7847;
%A_out_1 = 33;
%A_out_2 = 0.75;

%K = A_out_2 * sqrt((omega_1^2 * A_out_1^2 * (omega_2^4 - omega_1^2 * omega_2^2))/(omega_2^4 * A_out_2^2 - omega_1^4 * A_out_1^2))
%T = sqrt((omega_2^2 * A_out_2 - omega_1^2 * A_out_1)/(omega_1^4 * A_out_1^2 - omega_2^4 * A_out_2^2))
syms K_s T_s
[solK, solT] = solve(K_s/sqrt(T_s^2*w1^4+w1^2) == a1, K_s/sqrt(T_s^2*w2^4+w2^2) == a2)
K = abs(double(solK(1)))
T = abs(double(solT(1)))

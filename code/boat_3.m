%%% subex. a

%% Constants
omega_c = 0.1

%Nomoto constants from 1b
K = 0.1742
T = 86.5246

%% Calculation of controller
T_d = T
T_f = 1/(omega_c * tan(deg2rad(50)))
K_pd = sqrt((omega_c^2 * T_f)^2 + omega_c^2) / K

%% Results
%a) Got as follows:
% T_d = 86.5246
% T_f = 8.3910
% K_pd = 0.7494

%b) Does work? Yes. See plot no_disturbance
%c) Does work? No. Bias. See plot current_disturbance
%d) Does work? Ish. Wavy. See plot wave_disturbance

%sim('ship_5_kalman_release')
%gen_fig_5d(phi_out,phi_r_out,delta_out)


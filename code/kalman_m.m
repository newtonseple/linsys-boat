function [ x_est, P_est ] = kalman_m( psi_meas, delta )
%KALMAN_M Kalman filter
%   Detailed explanation goes here

persistent x_est_pre P_est_pre init_flag
if isempty(init_flag)
    init_flag = 1;
    x_est_pre = [0;0;0;0;0];
    P_est_pre = diag([1 0.013 pi^2 1 2.5e-4]);
end

K = P_est_pre*transpose(C)/(C*P_est_pre*transpose(C) + R);
x_est = x_est_pre + K * (psi_meas - C*x_est_pre);
x_est_pre = Ad*x_est + Bd*delta;
K*C
P_est = 1

end


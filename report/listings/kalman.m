function x_est  = kalman_m( psi_meas, delta )
% Definition of system
Ad = [0.9970,  0.09925, 0,    0,        0;
	 -0.06074, 0.9841,  0,    0,        0;
	  0,       0,       1,    0.09994, -1.006e-05;
	  0,       0,       0,    0.9988,  -0.0002012;
	  0,       0,       0,    0,        1];
Bd = [0; 0; 1.006e-05; 2.0121e-04; 0];
Cd = [0, 1, 1, 0, 0];
Ed = [2.488e-05, 0;
      4.963e-04, 0;
      0,        -3.355e-07;
      0,        -1.006e-05;
      0,         0.1000];
R = 6.0923e-07;
Q = [30 0; 0 1e-6];

% Initialization of a priori states
persistent x_est_pre P_est_pre init_flag
if isempty(init_flag)
    init_flag = 1;
    x_est_pre = [0; 0; 0; 0; 0];
    P_est_pre = diag([1 0.013 pi^2 1 2.5e-4]);
end

% Update step
K = P_est_pre*transpose(Cd)/(Cd*P_est_pre*transpose(Cd) + R); 
x_est = x_est_pre + K * (psi_meas - Cd*x_est_pre);
P_est = (eye(5)-K*Cd)*P_est_pre*transpose(eye(5)-K*Cd) + K*R*transpose(K);

% Projection step
x_est_pre = Ad*x_est + Bd*delta;
P_est_pre = Ad*P_est*transpose(Ad) + Ed*Q*transpose(Ed);
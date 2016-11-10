%% Constants needed: K, T, omega_0, lambda, K_w
% All from boat_2
K = 0.1742;
T = 86.5246;
omega_0 = 0.7823;
lambda = 0.0827;
K_w = 0.0050;

%% Model(full)
A = [0 1 0 0 0; 
    -omega_0^2 -2*lambda*omega_0 0 0 0;
    0 0 0 1 0 ;
    0 0 0 -1/T -K/T;
    0 0 0 0 0];
B = [0;0;0;K/T;0];
C = [0 1 1 0 0];
E = [0 0;K_w 0;0 0;0 0;0 1];
%% Model (no disturbance)
A_b = [0 1;0 -1/T];
B_b = [0; K/T];
C_b = [1 0];

%% Model (current disturbance)
A_c = 

%% Model (wave disturbance)

%% Model (both disturbances)
% = Full
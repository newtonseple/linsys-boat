%% Constants needed: K, T, omega_0, lambda, K_w
% All from boat_2
K = 0.1742;
T = 86.5246;
omega_0 = 0.7823;
lambda = 0.0827;
K_w = 0.0050;

observable = @(A, C) (rank(obsv(A,C)) == size(A,1));

%% Model (full)
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
A_c = [0 1 0;0 -1/T -K/T; 0 0 0];
B_c = [0; K/T; 0];
C_c = [1 0 0];

%% Model (wave disturbance)
A_d = [0 1 0 0; 
    -omega_0^2 -2*lambda*omega_0 0 0;
    0 0 0 1;
    0 0 0 -1/T];
B_d = [0;0;0;K/T];
C_d = [0 1 1 0];

%% Model (both disturbances)
% = Full
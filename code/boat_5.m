%% Constants needed: A, B, D from 4. Run 4 first.
%% a) Discretization
[Ad,Bd] = c2d(A,B,0.1)
[Ad,Ed] = c2d(A,E,0.1)
%% Results:
% Ad: [0.996954741048002,0.0992545087604663,0,0,0;-0.0607430933636516,0.984111959963574,0,0,0;0,0,1,0.0999422352218680,-1.00626243505991e-05;0,0,0,0.998844926931510,-0.000201213728530954;0,0,0,0,1]
% Bd: [0;0;1.00626243505991e-05;0.000201213728530954;0]
% Ed: [2.48798393851484e-05,0;0.000496272543802331,0;0,-3.35453114153722e-07;0,-1.00626243505991e-05;0,0.100000000000000]

%% b) Variance
% Simulated 10 000 seconds, used var(phi_out) to get 0.002
% That is, noise variance is 0.002
% That is in degrees, need radians -> 0.002 * (pi/180)^2
% =6.0923e-07
% Must divide by Ts
% =6.0923e-06

%% c) Kalman filter (this is the main thing)
Q = [30 0; 0 10^(-6)]
R = 6.0923e-06
P_pre = diag([1 0.013 pi^2 1 2.5e-4])
x_pre = [0;0;0;0;0]

%% simulation
%sim('ship_5_kalman_release')
%gen_fig_5d(phi_out,phi_r_out,delta_out)
clc, clear variables, close all

syms phi theta psi

%% 3 2 1 Example
transMat = [cos(theta)*cos(psi),cos(theta)*sin(psi),-sin(theta);...
    sin(phi)*sin(theta)*cos(psi)-...
    (cos(phi)*sin(psi)),sin(phi)*sin(theta)*sin(psi)+...
    (cos(phi)*cos(psi)),sin(phi)*cos(theta);...
    cos(phi)*sin(theta)*cos(psi)+(sin(phi)*sin(psi)),...
    cos(phi)*sin(theta)*sin(psi)-(sin(phi)*cos(psi)),...
    cos(phi)*cos(theta)];
% transMat * [Ii;Ji;Ki] = [Ib;Jb;Kb]
% [xd1;yd1;zd1] = inverse of Transmat * [u v w]
% To find angular velocity, it is phidot * 3n, + theta dot * 2A, 
% + psi dot * 31. Follow steps. So for 313, it would be:
% phi dot * Kn + theta dot * IA + psi dot * KI
% 3 1 3 = K I K; always n a i frames

%% Full mats

i_ph = [ 1 0 0; 0 cos(phi) sin(phi);0 -sin(phi) cos(phi)];
j_th = [cos(theta) 0 -sin(theta); 0 1 0;sin(theta) 0 cos(theta)];
k_ps = [cos(psi) sin(psi) 0;-sin(psi) cos(psi) 0; 0 0 1];

% For a 3 2 1, you do I * J * K
% Always do phi theta psi (i j k)
% Always do it backwards!!

i_th = [ 1 0 0; 0 cos(theta) sin(theta);0 -sin(theta) cos(theta)];
j_ps = [cos(psi) 0 -sin(psi); 0 1 0;sin(psi) 0 cos(psi)];
k_ph = [cos(phi) sin(phi) 0;-sin(phi) cos(phi) 0; 0 0 1];

i_ps = [ 1 0 0; 0 cos(psi) sin(psi);0 -sin(psi) cos(psi)];
j_ph = [cos(phi) 0 -sin(phi); 0 1 0;sin(phi) 0 cos(phi)];
k_th = [cos(theta) sin(theta) 0;-sin(theta) cos(theta) 0; 0 0 1];

%% 313 example

three13 = k_ph * i_th * k_ps;
three13 = simplify(three13);

Three13_trans = inv(three13) % This is [xd1 yd1 zd1]! 
% (Translational is inverse.)

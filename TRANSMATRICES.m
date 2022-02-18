clc, clear variables, close all

syms phi theta psi

%% 3 2 1
transMat = [cos(theta)*cos(psi),cos(theta)*sin(psi),-sin(theta);...
    sin(phi)*sin(theta)*cos(psi)-...
    (cos(phi)*sin(psi)),sin(phi)*sin(theta)*sin(psi)+...
    (cos(phi)*cos(psi)),sin(phi)*cos(theta);...
    cos(phi)*sin(theta)*cos(psi)+(sin(phi)*sin(psi)),...
    cos(phi)*sin(theta)*sin(psi)-(sin(phi)*cos(psi)),...
    cos(phi)*cos(theta)];

iMat_ph = [ 1 0 0; 0 cos(phi) sin(phi);0 -sin(phi) cos(phi)];
jMat_th = [cos(theta) 0 -sin(theta); 0 1 0;sin(theta) 0 cos(theta)];
kMat_ps = [cos(psi) sin(psi) 0;-sin(psi) cos(psi) 0; 0 0 1];

% For a 3 2 1, you do I * J * K
% Always do it backwards!!

%% 3 1 3

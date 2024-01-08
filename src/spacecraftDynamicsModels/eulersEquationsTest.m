% Test solution to euler's equations and rotational kinematics

close all;
clear;

numberOfIterations = 150;


omega = [];       % initial angular rates
omega(1) = 0;     % X-axis angular rate
omega(2) = 01;     % Y-axis angular rate
omega(3) = 0.1;     % Z-axis angular rate
omega_x= zeros(1,numberOfIterations);
omega_y= zeros(1,numberOfIterations);
omega_z= zeros(1,numberOfIterations);

M = zeros(1,3);     % Moments acting on satellite x,y,z axis in body frame
M(3) = 0;
I_xx = .025;        % 
I_yy = .025;
I_zz = .005;
param(1) = I_xx;
param(2) = I_yy;
param(3) = I_zz;

h = .1;          % timestep

t = zeros(1,numberOfIterations);

C = [1, 0, 0;...
     0, 1, 0;...
     0, 0, 1];

q = [0;0;0;1];
u = 0;

eulerX = zeros(1,numberOfIterations);
eulerY = zeros(1,numberOfIterations);
eulerZ = zeros(1,numberOfIterations);

figure(1);

% for zeta1 = 0: .1 :1 
%     param(2)= zeta1;
for i = 1 : numberOfIterations

    t(i) = i*h;
    % euler's equations solution
    omega_next = RungeKutta(@eulersEquations, omega, h, M, param);
    omega_x(i)= omega_next(1);
    omega_y(i)= omega_next(2);
    omega_z(i)= omega_next(3);
    omega = omega_next;

    % rotational kinematics solution
%     C_next = RungeKutta(@orientationDCM, C, h, 0, omega);
%     C_next = orthonormalize(C_next);
%     C = C_next;
%     
%     eulerAngles = DCMToEulerAngles_321(C);
%     eulerAngles = rad2deg(eulerAngles);
%     eulerX(i) = eulerAngles(1);
%     eulerY(i) = eulerAngles(2);
%     eulerZ(i) = eulerAngles(3);
    % using quaternion solution
    q_next = RungeKutta(@orientationQuaternions, q, h, u, omega);

    q = q_next;
    eulerAngles = QuaternionToEulerAngles(q);
    eulerX(i)=eulerAngles(1);
    eulerY(i)=eulerAngles(2);
    eulerZ(i)=eulerAngles(3);

end
plot(t,omega_x,'r');
hold on;
plot(t,omega_y,'g');
plot(t,omega_z,'b');

% omega(1) = 1;     % X-axis angular rate
% omega(2) = 0;     % Y-axis angular rate
% omega(3) = 0;     % Z-axis angular rate
% hold on;
% end

figure(2);
plot(t, eulerX,'r');
hold on;

plot(t, eulerY, 'g');
plot(t, eulerZ, 'b');
















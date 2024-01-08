% Test Rotational Kinematics using DCM and constant angular rate.

close all;
clear;
h = .01;

numberOfIterations = 1500;


C = [1, 0, 0;...
     0, 1, 0;...
     0, 0, 1];
omega = [0,1,0];

u = 0;

eulerX = zeros(1,numberOfIterations);
eulerY = zeros(1,numberOfIterations);
eulerZ = zeros(1,numberOfIterations);

t = zeros(1,numberOfIterations);

for i = 1 : numberOfIterations

    t(i) = i*h;
    C_next = RungeKutta(@orientationDCM, C, h, u, omega);
%     C_next = orthonormalize(C_next);
    C = C_next;
    
%     x(:,i) = C * xi;
    eulerAngles = DCMToEulerAngles_321(C);
    eulerAngles = rad2deg(eulerAngles);
    eulerX(i) = eulerAngles(1);
    eulerY(i) = eulerAngles(2);
    eulerZ(i) = eulerAngles(3);
   
end


% figure(1);
% plot(t,x);

figure(1)
plot(t, eulerX,'r');
hold on;

plot(t, eulerY, 'g');
plot(t, eulerZ, 'b');








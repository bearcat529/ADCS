% Test Rotational Kinematics using quaternions and constant angular rate.

close all;
clear;
h = .01;

numberOfIterations = 1500;

angles = [0,0,0] ;
omega = [1,.1,0];

u = 0;

eulerX = zeros(1,numberOfIterations);
eulerY = zeros(1,numberOfIterations);
eulerZ = zeros(1,numberOfIterations);

t = zeros(1,numberOfIterations);

for i = 1 : numberOfIterations

    t(i) = i*h;
    angle_next = RungeKutta(@orientationEulerAngles, angles, h, u, omega);

    angles = angle_next;
    
    eulerX(i)=angle_next(1);
    eulerY(i)=angle_next(2);
    eulerZ(i)=angle_next(3);
    

    
end


figure(1)
plot(t, eulerX,'r');
hold on;

plot(t, eulerY, 'g');
plot(t, eulerZ, 'b');








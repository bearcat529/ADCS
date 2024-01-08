% Test Rotational Kinematics using quaternions and constant angular rate.

close all;
clear;
h = .01;

numberOfIterations = 1500;

q =  [0;0;0;1] ;
omega = [1,.1,0];

u = 0;

eulerX = zeros(1,numberOfIterations);
eulerY = zeros(1,numberOfIterations);
eulerZ = zeros(1,numberOfIterations);

t = zeros(1,numberOfIterations);

for i = 1 : numberOfIterations

    t(i) = i*h;
    q_next = RungeKutta(@orientationQuaternions, q, h, u, omega);

    q = q_next;
    eulerAngles = QuaternionToEulerAngles(q);
    eulerX(i)=eulerAngles(1);
    eulerY(i)=eulerAngles(2);
    eulerZ(i)=eulerAngles(3);
    

    
end


figure(1)
plot(t, eulerX,'r');
hold on;

plot(t, eulerY, 'g');
plot(t, eulerZ, 'b');








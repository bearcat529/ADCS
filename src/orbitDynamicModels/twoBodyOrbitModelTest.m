close all;
clear;

close all;
clear;
h = .001; % step size (seconds)
runtime= 5; % hours

u=0;
param=0;
y = [];
y(1)= 6.0359e+06;               % Initial positon x
y(2)= -1.9249e+06;              % y
y(3)= 2.4284e+06;               % z 
y(4)= -3.5050e+03;              % Initial velocity x
Y(5)= -4.2337e+03;              % y
y(6)= 5.3399e+03;               % z

numberOfIterations = runtime*60*60/h;

position_X = zeros(1,numberOfIterations);
position_Y = zeros(1,numberOfIterations);
position_Z = zeros(1,numberOfIterations);
velocity_X = zeros(1,numberOfIterations);
velocity_Y = zeros(1,numberOfIterations);
velocity_Z = zeros(1,numberOfIterations);


t = zeros(1,numberOfIterations);

for i = 1 : numberOfIterations

    t(i) = i*h;
    y_next = RungeKutta(@twoBodyOrbitModel, y, h, u, param);

    y = y_next;
    
    position_X(i) = y(1);
    position_Y(i) = y(2);
    position_Z(i) = y(3);
    velocity_X(i) = y(4);
    velocity_Y(i) = y(5);
    velocity_Z(i) = y(6);

    

    
end

figure(1);
plot3(position_X, position_Y, position_Z);
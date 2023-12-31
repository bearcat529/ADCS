close all;
clear;




omega_n = 1;
zeta = .1;

numberOfIterations = 150;


y=[];
y(1) = 0;
y(2) = 0;
u = 1;
h = .1;
y_1 = zeros(1,numberOfIterations);
y_2 = zeros(1,numberOfIterations);
t = zeros(1,numberOfIterations);
param(1) = omega_n;
param(2) = zeta;

figure(1);

for zeta1 = 0: .1 :1 
    param(2)= zeta1;
for i = 1 : numberOfIterations

    t(i) = i*h;
    y_next = RungeKutta(@secondOrderResponse, y, h, u,param);
    y_1(i)= y_next(1);
    y_2(i)= y_next(2);
    y = y_next;
end
plot(t,y_1);
y(1) = 0;
y(2) = 0;
hold on;
end














function y_next = secondOrderResponse(y, u,param)
    omega_n = param(1);
    zeta = param(2);
    y_next(1) = y(2);
    y_next(2) = -(omega_n)^2 * y(1) - 2* zeta * omega_n * y(2) + ((omega_n)^2 * u);
end



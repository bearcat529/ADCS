

function y_next = RungeKutta(f, y, h, u,param)

    k1 = h * f(y,u,param);
    k2 = h * f(y + 0.5 * k1,u,param); 
    k3 = h * f(y + 0.5 * k2,u,param); 
    k4 = h * f(y + k3,u,param);

    y_next = y +  (1/6) * (k1 + 2*k2 + 2*k3 + k4); 

end
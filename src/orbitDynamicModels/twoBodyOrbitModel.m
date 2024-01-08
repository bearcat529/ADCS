function y_next = twoBodyOrbitModel(y,u,~)
    G = 6.6743e-11;                     % General gravitational constant
    M = 5.97219e24;                     % Mass of earth in kg
    mu = G * M;                         % Earth's gravitational constant
    r_earth = 6378100;
    j_2 = 1082.64e-6 ;                   % pertubation due to non spherical earth


   r_mag = sqrt(y(1)^2 + y(2)^2 + y(3)^2);
   y_next(1) = y(4); 
   y_next(2) = y(5); 
   y_next(3) = y(6); 
   y_next(4) =  (-mu / (r_mag)^3) * y(1) * (1 - (j_2 * (3/2) * (r_earth/r_mag)^2 * (5 * y(3)^2 / r_mag^2 - 1)));  
   y_next(5) =  (-mu / (r_mag)^3) * y(2) * (1 - (j_2 * (3/2) * (r_earth/r_mag)^2 * (5 * y(3)^2 / r_mag^2 - 1))); 
   y_next(6) =  (-mu / (r_mag)^3) * y(3) * (1 + (j_2 * (3/2) * (r_earth/r_mag)^3 * (3 - 5 * y(3)^2 / r_mag^2))); 
end
function dcm = EulerAnglesToDCM_321(x,y,z)
DEG2RAD = pi/180;
x = x * DEG2RAD;
y = y * DEG2RAD;
z = z * DEG2RAD;

x_rot = [1      0       0; 
        0  cos(x)  sin(x); 
        0 -sin(x)  cos(x)]; 

y_rot = [cos(y) 0 -sin(y); 
             0  1      0; 
         sin(y) 0 cos(y)]; 

z_rot = [ cos(z)  sin(z) 0; 
         -sin(z)  cos(z) 0; 
              0   0      1]; 

dcm = x_rot*y_rot*z_rot;  

%dcm = [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)] *...
%      [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)] *...
%      [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];




end
% angles = [x;y;z]
%https://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles
function q = EulerAnglesToQuaternion(angles)
    q = [sin(angles(1)/2)*cos(angles(2)/2)*cos(angles(3)/2)-cos(angles(1)/2)*sin(angles(2)/2)*sin(angles(3)/2);...
         cos(angles(1)/2)*sin(angles(2)/2)*cos(angles(3)/2)+sin(angles(1)/2)*cos(angles(2)/2)*sin(angles(3)/2);...
         cos(angles(1)/2)*cos(angles(2)/2)*sin(angles(3)/2)-sin(angles(1)/2)*sin(angles(2)/2)*cos(angles(3)/2);...
         cos(angles(1)/2)*cos(angles(2)/2)*cos(angles(3)/2)+sin(angles(1)/2)*sin(angles(2)/2)*sin(angles(3)/2)];
end
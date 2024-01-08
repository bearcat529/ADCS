 % https://www.vectornav.com/resources/inertial-navigation-primer/math-fundamentals/math-attitudetran

function angles = DCMToEulerAngles_321(C) 
    angles(3)= atan(C(1,2)/C(1,1));
    angles(2)= -asin(C(1,3));
    angles(1)= atan(C(2,3)/C(3,3));


% Fixing signs due to trig functions being limited to +- pi/2
% institute logic to get to -pi +pi


% If opposite is positive and adjacent is negative it's in quadrant 2
    if (C(3,3)<0 && C(2,3)>0)
        angles(1)=angles(1)+pi;
    end
% If opposite is negative and adjacent is negative it's in quadrant 3
    if (C(3,3)<0 && C(2,3)<0)
        angles(1)=angles(1)-pi;
    end
% If opposite is positive and adjacent is negative it's in quadrant 2
    if(C(1,1)<0 && C(1,2)>0)
        angles(3)= angles(3)+pi;
    end
% If opposite is negative and adjacent is negative it's in quadrant 3
    if(C(1,1)<0 && C(1,2)<0)
        angles(3)= angles(3)-pi;
    end

% Used C(1,3) to find it sin was + or - then used C(3,3)/cos(angles(3)) to
% determine if cos is + or - then used that info to find quadrant and
% correct if needed
%     if(C(1,3)>0 && (C(3,3)/cos(angles(3)))<0)
%         angles(2)= -pi - angles(2);
%     end
%     if(C(1,3)<0 && (C(3,3)/cos(angles(3)))<0)
%         angles(2)= pi - angles(2);
%     end
        if(C(1,3)>0 && (C(3,3))<0)
        angles(2)= -pi - angles(2);
    end
    if(C(1,3)<0 && (C(3,3))<0)
        angles(2)= pi - angles(2);
    end

end
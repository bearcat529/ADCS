% function Y = orthonormalize(X) 
%     % Pull rows out of X
%     e1 = X(1,:)';
%     e2 = X(2,:)';
%     e3 = X(3,:)';
% 
%     e3 = cross(e1,e2);
%     e3  = e3/norm(e3);
%     e1 = cross(e2, e3);
%     e1 = e1/norm(e1);
%     e2 = cross(e3, e1);
%     e2 = e2/norm(e2);
% 
%     Y = [e1'; e2'; e3';];


function Y = orthonormalize(X) 
    % Pull rows out of X
    e1 = X(1,:)';
    e2 = X(2,:)';
    e3 = X(3,:)';

    e3 = crossV(e1) * e2;
    e3  = e3/sqrt(e3' * e3);
    e1 = crossV(e2) * e3;
    e1 = e1/sqrt(e1' * e1);
    e2 = crossV(e3) * e1;
    e2 = e2/sqrt(e2' * e2);

    Y = [e1'; e2'; e3';];

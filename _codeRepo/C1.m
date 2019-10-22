function [matrix] = C1(theta)
    % C1 rotation matrix for angle theta [rad]
    
    row1 = [1 0 0];
    row2 = [0 cos(theta) -sin(theta)];
    row3 = [0 sin(theta) cos(theta)];
    
    matrix = [row1; row2; row3];
end
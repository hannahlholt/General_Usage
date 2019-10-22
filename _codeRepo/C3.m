function [matrix] = C3(theta)
    % C3 rotation matrix for angle theta [rad]
    
    row1 = [cos(theta) sin(theta) 0];
    row2 = [-sin(theta) cos(theta) 0];
    row3 = [0 0 1];
    
    matrix = [row1; row2; row3];
end
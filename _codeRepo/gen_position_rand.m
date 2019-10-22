function [r_i, phi, theta, x, y, z] = gen_position_rand(r_tube, i, N)
    a = (i - 0.5)/N; 
    r_i = sqrt(a) * r_tube;             % initial radius of particle @ x = 0 [mm]         
    phi = 2*pi*rand();                  % azimuth angle
    theta = acos( (rand())^(0.5) );     % 
    
    x = 0;                              % generate position at begining of tube x = 0
    y = r_i*sin(phi);                    % position in global coordinates X,Y,Z
    z = r_i*cos(phi);                    %
end
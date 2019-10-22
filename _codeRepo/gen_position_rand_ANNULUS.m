function [r_i, x, y, z] = gen_position_rand_ANNULUS(width, R_inner, i, N)    
    % generate a radius in between the two tube radii
    a = (i - 0.5)/N; 
    r_i = sqrt(a) * width;             
    r_i = R_inner + r_i;                 % initial radius of particle in annulus @ x = 0 [mm] 
    
    phi = 2*pi*rand();                              % azimuth angle
    theta = acos( (rand())^(0.5) );     % * 180/pi;      % 
    
%     theta_min = atan(R_inner/L);             % minimum theta angle
%     
%     while theta < theta_min
%         theta = acos( (rand())^(0.5) );
%     end
%     
    x = 0;                              % generate position at begining of tube x = 0
    y = r_i*sin(phi);                    % position in global coordinates X,Y,Z
    z = r_i*cos(phi);                    %

function [u_i, v_i, w_i, phi_i, theta_i] = gen_velocity_rand_ANNULUS(beta, s, a, b)

    r_vel = (-log(rand()))^(0.5) / beta;            % initial "radius" in y-z (transverse) velocity space
    
    phi_i = 2*pi*rand();                              % azimuth angle
    theta_i = acos( (rand())^(0.5) );     % * 180/pi;      % 
    
    v_i = r_vel*sin(phi_i);                         % y velocity                
    w_i = r_vel*cos(phi_i);                         % z velocity
    
    % now use the P/Pmax method to calculate u, the x velocity
    sn = s*cos(theta_i);               % normal component of u' to stream
    
    % generate two random fractions btw [0 1]
    R1 = rand();
    R2 = rand();
       
    
    % generate u' = a + Rf*(b-a)   (thermal velocity component)
    u_th = a + R1*(b - a);
    
    % repeat process until a valid u_i is chosen
    while PPmax(beta, u_th, sn) < R2
        
        % generate two new random fraction
        R1 = rand();
        R2 = rand();

        % generate another u
        u_th = a + R1*(b - a);
        
    end
    
    % calculate the velocity component u = u_th + u0
    u_i = u_th + (s/beta);
    
    
    
    
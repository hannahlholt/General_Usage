function R = PPmax(beta, u, sn)
% PPmax is a function that calculates the ratio of fx/fx_max = P/Pmax to
% generate representative velocity components for the acceptance-rejection
% Monte Carlo method

%   Inputs
%   beta        sqrt(m/2kbT) 
%   u'          thermal velocity component u' = r_vel - u0 
%   sn          u0*beta*cos(theta)

A = 2*(beta*u + sn)/(sn + (sn^2 + 2)^0.5); 
exponent = 0.5 + sn/2*(sn - (sn^2 + 2)^0.5) - (beta*u)^2 ;

R = A*exp(exponent);

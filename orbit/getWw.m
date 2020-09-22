function [W,w] = getWw(kep_state,dt)
%%% Equations of W & w due to the effect of the Earth's oblatenes
%
% Inputs:
%   kep_state = State vector of Keplerian elements: [a,e,i,w,W,f]
%
% Output:
%   w = Argument of periapsis
%   W = Longitude of ascending node 
% 
% Reference:
%   Howard D. Curtis - Orbital Mechanics For Engineering Students
%
% 2020/6/4

% Unpack Keplerian parameters
a = kep_state(1);  
e = kep_state(2);  
i = kep_state(3);  
w = kep_state(4);
W = kep_state(5);

% Import physical parameters
physicalParams

fac     = -3/2*sqrt(u)*J2*Re^2/(1-e^2)^2/a^(7/2); % Common factor 
W_dot   = fac*cos(i);                               
w_dot   = fac*(5/2*sin(i)^2 - 2);

W = W + W_dot*dt;
w = w + w_dot*dt;
end
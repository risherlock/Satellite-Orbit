function E = keplerianDynamics(e, M)
%%% Newton’s method to solve Kepler’s equation: E - e*sin(E) = M
%
% Inputs:
%   e = Eccentricity of orbit
%   M = Mean anomaly of orbit
%
% Output:
%   E = Eccentric anomaly
%
% Reference:
%   Howard D. Curtis - Orbital Mechanics For Engineering Students
%
% 2020/6/4

tolerance = 1.e-8;
ratio = 1;

% Initial guess for E:
if M < pi   
    E = M + e/2;
else
    E = M - e/2;
end 

% Iterate till tolerance is met
while abs(ratio) > tolerance
    f     = E - e*sin(E) - M;
    f_dot = 1 - e*cos(E);
    
    ratio = f/f_dot;
    E     = E - ratio;
end
end %kepler_E

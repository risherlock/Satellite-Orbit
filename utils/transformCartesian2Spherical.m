function [alpha, delta, h] = transformCartesian2Spherical(r)
%%% Computes right ascension and declination from position vector
%
% Input:
%   r = Position vector of satellite in ECI or ECEF
%
% Outputs:
%   alpha = Right ascension of satellite
%   delta = Declination of satellite
%   h     = Height of satellitem
%
% Source:
%   Howard D. Curtis - Orbital Mechanics For Engineering Students
% 
% 2020/6/4

% Direction cosines of r
h = norm(r);
l = r(1)/norm(r);
m = r(2)/norm(r);
n = r(3)/norm(r);

delta = asin(n);
if m>0
     alpha = acos(l/cos(delta));
else
    %alpha = 2*pi - acos(l/cos(delta)); % In the book (+ve from origin)
    alpha = - acos(l/cos(delta)); % My edit (0 in middle, +ve & -ve on either sides)
end
end 
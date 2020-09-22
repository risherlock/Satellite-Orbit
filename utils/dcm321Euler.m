function [C] = dcm321Euler(psi,theta,phi)
%%% DCM in terms of (3-2-1) Euler angles
% Maps a vector from inertial to body frame: V_b = C*V_i
%   
% Inputs:
%   psi     = The yaw rotation (radians)
%   theta   = The pitch rotation (radians)
%   phi     = The roll rotation (radians)
%
% Output:
%   C = Direction cosine matrix
%
% References:
%   Schaub - Analytical Mechanics of Space Systems (2nd ed.)(Pg.89)
%   Ardakani - Review of the 3-2-1 Euler Angles (2010)
%
% 2020/6/23

c1 = cos(psi);
s1 = sin(psi);
c2 = cos(theta);
s2 = sin(theta);
c3 = cos(phi);
s3 = sin(phi);

C = [   c2*c1,              c2*s1,              -s2;    ... 
        s3*s2*c1 - c3*s1,   s3*s2*s1 + c3*c1,   s3*c2;  ...    
        c3*s2*c1 + s3*s1,   c3*s2*s1 - s3*c1,   c3*c2  ];
end
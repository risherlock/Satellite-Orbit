function [C] = dcm313Euler(W,i,w)
%%% DCM in terms of (3-1-3) Euler angles
% Maps a vector from inertial to body frame: V_b = C*V_i
%   
% Inputs:
%   W   = Longitude of the ascending node (radians)
%   i   = Inclination (radians)
%   w   = Argument of the perihelion (radians)
%
% Output:
%   C = Direction cosine matrix
%
% References:
%   Schaub - Analytical Mechanics of Space Systems (2nd ed.) (Pg.89)
%
% 2020/6/23

c1 = cos(W);
s1 = sin(W);
c2 = cos(i);
s2 = sin(i);
c3 = cos(w);
s3 = sin(w);

C = [   c3*c1 - s3*c2*s1        c3*s1 + s3*c2*c1    s3*s2; ...
        -s3*c1 - c3*c2*s1,      -s3*s1+c3*c2*c1,    c3*s2; ...    
        s2*s1                   -s2*s1,             c2  ];
end
function [v_ecef]  = transformECI2ECEF(v_eci,theta)
%%% Transforms a vector from ECI frame to ECEF frame
%
% Inputs:
%   v_eci  = A vector in ECI frame
%   theta  = Angle of rotation of ECEF from ECI (radians)
%
% Output:
%   v_ecef = A vector in ECEF frame
%
% Reference:
%   Howard D. Curtis - Orbital Mechanics For Engineering Students
%
% 2020/6/4

% ECI and ECEF overlap at t=0
% Their x-axis separates by angle theta as Earth rotates
% 3-2-1 rotation sequence from ECI to ECEF: theta,0,0  
v_ecef = dcm321Euler(theta,0,0)*v_eci; 
end
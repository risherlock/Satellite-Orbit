function [v_eci]  = transformECEF2ECI(v_ecef,theta)
%%% Transforms a vector from ECEF frame to ECI frame
%
% Inputs:
%   v_ecef  = A vector in ECEF frame
%   theta   = Angle of rotation of ECEF from ECI (radians)
%
% Output:
%   v_eci = A vector in ECI frame
%
% Reference:
%   Howard D. Curtis - Orbital Mechanics For Engineering Students
%
% 2020/6/13

% ECI and ECEF overlap at t=0
% Their x-axis separates by angle theta as Earth rotates
% 3-2-1 rotation sequence from ECI to ECEF: theta,0,0  
v_eci = dcm321Euler(theta,0,0)'*v_ecef; 
end
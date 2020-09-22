function [r,v] = transformKeplerians2ECI(kep_state)
%%% Perifocal (Keplerian) to Geocentric (ECI) frame
%
% Inputs:
%   kep_state = State vector of Keplerian elements: [a,e,i,w,W,f]
%
% Outputs:
%   [r,v] = Position and velocity vector of satellite in ECI frame
%
% References:
%   Howard D. Curtis - Orbital Mechanics For Engineering Students
%   Hanspeter Schaub - Analytical Mechanics of Space Systems
%
% 2020/6/3

% Import physical parameters
physicalParams;

% Unpack Keplerian parameters
a =  kep_state(1);  
e =  kep_state(2);  
i =  kep_state(3);  
w =  kep_state(4);  
W =  kep_state(5);  
f =  kep_state(6);  

h = sqrt(u*a*(1 - e^2)); % Specific angular momentum (km^2/s)

%%% Position and velocity in the perifocal frame.
rp = (h^2/u)*(1/(1 + e*cos(f)))*[cos(f); sin(f); 0];
vp = (u/h)*[-sin(f); e + cos(f); 0];

%%% Transform Position and velocity to the ECI frame. 
% 3-1-3 rotation sequence from ECI to perifocus: W,i,w  
% Why 3-1-3? Because two rotations about the Z body axis are performed.
r = dcm313Euler(W,i,w)'*rp;
v = dcm313Euler(W,i,w)'*vp;
end

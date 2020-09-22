%%% Initialize simulation parameters
% 2020/23/6

%%% Set Simulation parameters
sim_time    = 0.0671; % (days)
dt          = 10;    % Timestep(s)

%%% Set initial Keplerians of the satellite
% Import physical parameters
physicalParams;
rP = Re+600;         % Perigee of orbit (km)
rA = Re+600;         % Apogee of orbit (km)
a = (rA + rP)/2;     % 1) Semimajor axis (km)
e = 0.5*(rA - rP)/a; % 2) Eccentricity 
i = 56*deg2rad;      % 3) Inclination (rad)
w = 0*deg2rad;       % 4) Argument of periapsis (rad)
W = 0*deg2rad;       % 5) Longitude of the ascending node (rad)
f = 0*deg2rad;       % 6) True anomaly (rad)
init_kepler = [a;e;i;w;W;f];

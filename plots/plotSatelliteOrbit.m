function [] = plotSatelliteOrbit(alpha,delta,R)
%%% Plots ground track and 3d orbit
% 
% Inputs:
%   alpha = Right ascension in ECI or ECEF frame (1*n)
%   delta = Diclination in ECI or ECEF frame (1*n)
%   r     = Position vector in ECI or ECEF frame (3*n) 
%
% 2020/6/23

set(groot,'defaulttextinterprete','latex');  
set(groot, 'defaultAxesTickLabelInterprete','latex');  
set(groot, 'defaultLegendInterprete','latex');

% Plot groundtrack
figure('name','Ground track');
plotGroundTrack(alpha,delta);
title('Ground track of satellite');

% Plot 3d Earth
figure('name','3D orbit of satellite');
plot3dOrbit(R);
end

function [] = plotGroundTrack(alpha,delta)
%%% Plots ground track   
% 
% Inputs:
%   alpha = Right ascension in ECI or ECEF frame (1*n)
%   delta = Declination in ECI or ECEF frame (1*n)

rad2deg = 180/pi;
hold on;
geoshow('landareas.shp','FaceColor','green');       % Plot map
plot(alpha*rad2deg, delta*rad2deg,'.'); grid on;    % Plot ground track
% axis ([0 360 -90 90])% To recreate Howard Curtis' plot (change alpha too)
hold off;
end

function [] = plot3dOrbit(R)
%%% Plots orbit using cartesian position vector
% 
% Inputs:
%   r     = Position vector  in ECI or ECEF frame(3*n)

plotEarth;
plot3(R(1,:), R(2,:), R(3,:),'.');
end

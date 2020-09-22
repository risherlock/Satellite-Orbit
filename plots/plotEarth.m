%%% Textured 3D Earth example
% Ryan Gray (8 Sep 2004)
% Revised 9 March 2006, 31 Jan 2006, 16 Oct 2013
% Minor modifications are made to the original code of Ryan Gray
%
% 2020/6/23

% Options
% space_color = '';
npanels = 180; % No. of globe panels around the equator (deg/npanels)
alpha   = 0.9; % Transparency level, 1 = opaque, through 0 = invisible
% GMST0 = [];    % Don't set up rotatable globe (ECEF)
GMST0 = 4.89496121282306; % Set up a rotatable globe at J2000.0

% Earth texture image (2:1 unprojected globe)
% http://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Land_ocean_ice_2048.jpg/1024px-Land_ocean_ice_2048.jpg
image_file = 'earth.jpg';

% Mean spherical earth
e_rad    = 6371.0087714;     % Equatorial radius (km)
p_rad    = 6371.0087714;     % Polar radius (km)
e_rot    = 7.2921158553e-5;  % Earth rotation rate (radians/sec)

% Create figure
% figure('Color', space_color);
% hold on;

% Turn off the normal axes
set(gca, 'NextPlot','add', 'Visible','off');
axis equal; axis auto; grid on;

% Set initial view
view(0,0); axis vis3d;

% Create wireframe globe and 3D meshgrid of the sphere points
[x, y, z] = ellipsoid(0, 0, 0, e_rad, e_rad, p_rad, npanels);
globe = surf(x, y, -z, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);

if ~isempty(GMST0)
    hgx = hgtransform;
    set(hgx,'Matrix', makehgtform('zrotate',GMST0));
    set(globe,'Parent',hgx);
end

% Load Earth image for texture map
cdata = imread(image_file);

% Set image as color data (cdata) property
% Set face color to indicate a texturemap, which Matlab expects in cdata 
% Turn off the mesh edges
set(globe, 'FaceColor', 'texturemap', 'CData', cdata, ...
    'FaceAlpha', alpha, 'EdgeColor', 'none');

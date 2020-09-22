%%% Add all subfolders to path
% Credit: https://github.com/CAOR-MINES-ParisTech
% 2020/6/23

addpath(pwd);

% Add directories to the Matlab path.
cd orbit;
addpath(genpath(pwd));
cd ..;

cd plots;
addpath(genpath(pwd));
cd ..;

cd utils;
addpath(genpath(pwd));
cd ..;

% Ask user if the path should be saved or not
fprintf('Ground Track added to Matlab''s path.\n');
response = input('Save path for future Matlab sessions? [Y/N] ', 's');
if strcmpi(response, 'Y')
    failed = savepath();
    if ~failed
        fprintf('Path saved: no need to call setup next time.\n');
    else
        fprintf(['Something went wrong.. Perhaps missing permission ' ...
                 'to write on pathdef.m?\nPath not saved: ' ...
                 'please re-call setup next time.\n']);
    end
else
    fprintf('Path not saved: please re-call setup next time.\n');
end



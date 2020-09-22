function y_update = RK4(f,y,dt,t) 
%%% RK4 integrator step implementation
%
% Inputs: 
%   f  = Differential equation to be integrated.
%   y  = Input state of the differential function (y_t).
%   dt = Timestep.
%   t  = Current timestamp.
%
% Output:
%   y_update = Output state (y_{t+1}).
%
% 2020/5/31

k1 = f(t, y);
k2 = f(t + 0.5*dt, y + 0.5*dt*k1);
k3 = f(t + 0.5*dt, y + 0.5*dt*k2);
k4 = f(t + dt, y + dt*k3);
    
K = (1/6)*(k1 + 2*k2 + 2*k3 + k4);
y_update = y + K*dt; 
end
clear all; close all; clc;

tspan = [0 1000];
S0 = [20; 1]; % S0(0) = initial height, S0(1) = initial velocity

peakheight = S0(1);
hstop = 0.01;

options = odeset('Events', @bounceEventsFcn);

[t,S] = ode45(@bounce, tspan, S0, options);


plot(t, S(:,1))
xlabel('Time (sec)')
ylabel('Y Position (m)')
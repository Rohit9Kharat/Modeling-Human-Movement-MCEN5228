clear all; close all; clc;

tspan = [0 10];
S0 = [1; 0];

options = odeset('Events', @appleEventsFcn);
[t,S] = ode45(@odefun, tspan, S0, options);

plot(t, S(:,1))
xlabel('Time (sec)')
ylabel('Y Position (m)')
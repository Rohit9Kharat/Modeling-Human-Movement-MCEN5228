% Demo to simulate a bouncing ball.
clc;    % Clear the command window.
fprintf('Beginning to run %s.m.\n', mfilename);
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 20;

h0 = 20;	% Initial drop height in meters.
vy = 0;		% Initial y velocity in m/sec.
vx = 0.5;		% Initial x velocity in m/sec.
g = 9.8;	% Gravitational acceleration in m/s^2;
t = 0;		% Initial time when dropped
dt = 0.01;	% Delta time in seconds.
rho = 0.75;	% Velocity reduction factor.  Velocity reduces this much after a bounce.
gamma = 0.8; % damping rate for horizontal velocity
peakHeight = h0;	% Initial drop height in meters.
h = h0;		% Instantaneous height.
hstop = 0.01;	% Height at which if the peak height after a bounce is less than this, stop the simulation.
% Preallocate arrays for time and height.  Make them plenty large - we will crop to the final size later.
T = 0 : dt : 1000;
H = zeros(1, length(T));
x = vx * T;

% Setup a failsafe.  Don't do more than this number of iterations or else we might have an infinite loop.  This will prevent that.
maxIterations = 100000;		
loopCounter = 1;
while (peakHeight > hstop) && (loopCounter < maxIterations)
	% Compute new height.
	hNew = h + vy * dt - 0.5 * g * dt ^ 2;
	% 	fprintf('After iteration %d, time %f, hmax = %f.\n', loopCounter, T(loopCounter), hNew);
	if(hNew<0)
		% Ball hit the ground.
		
		% Find index of last time h was 0
		lastBounceIndex = find(H(1 : loopCounter-1) == 0, 1, 'last');
		if isempty(lastBounceIndex)
			% If it hasn't bounced yet, start looking from the beginning.
			lastBounceIndex = 1;
		end
		% Compute the greatest height since the last bounce, or the initial release.
		[peakHeight, index] = max(H(lastBounceIndex : end)); % Record height
		% Find time when it was at that height.
		tMax = T(index + lastBounceIndex - 1);
		xMax = x(index + lastBounceIndex - 1);
		plot(xMax, peakHeight,'LineWidth', 2);
		hold on;
		fprintf('After iteration %d, time %f, hmax = %f, xMax = %f.\n', loopCounter, tMax, peakHeight, xMax);
		
		% Reflect it up.  For example, if at this time,
		% the ball was going to be at -4 (with no ground in the way)
		% Now, after bouncing, it would be at +4 above the ground.
		h = 0; %abs(hNew);
		vy = -vy * rho;
		
	else
		% Ball is falling or rising.
		vy = vy - g*dt;
		h = hNew;
	end
	H(loopCounter) = h;
	loopCounter = loopCounter + 1;
end
% Crop times.
T = T(1 : loopCounter - 1);
x = gamma*vx * T;
H = H(1 : loopCounter - 1);
% Plot the trajectory.
plot(x, H);
grid on;
xlabel('X (meters)', 'FontSize', fontSize)
ylabel('Ball Position Y (m)', 'FontSize', fontSize)
title('Vertical postion vs Horizontal position', 'FontSize', fontSize)
[a,b] = ginput;   % click on the location you want+ Return
text(a,b,'Horizontal Damping Rate = 0.8, COR = 0.75');

figure
plot(T,x);
grid on;
xlabel('Time (sec)', 'FontSize', fontSize)
ylabel('X (meters)', 'FontSize', fontSize)
title('Horizontal position wrt Time', 'FontSize', fontSize)
[a,b] = ginput;   % click on the location you want+ Return
text(a,b,'Horizontal Damping Rate = 0.8');

figure
plot(T,H);
grid on;
xlabel('Time (sec)', 'FontSize', fontSize)
ylabel('Y (meters)', 'FontSize', fontSize)
title('Vertical position wrt Time','FontSize', fontSize)
[a,b] = ginput;   % click on the location you want+ Return
text(a,b,'Coeff of Restitution = 0.75');


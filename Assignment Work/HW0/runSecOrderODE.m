% Solve ODE using MATLAB's ode45

t0 = 0;
x0 = 5;
x(2) = 0; 
tEnd = 10;

%% Solving using ode45

[tSol, xSol] = ode45(@(t,x) SecondOrderODEfunc(t,x), [t0 tEnd], [x0 x(2)]);

%% Plot results

plot(tSol, xSol(:, 1), '-o')
title('Solving Second-order ODE using ode45')
xlabel('Time [sec]')
ylabel('x(t)')
[x,y] = ginput;   % click on the location you want+ Return
text(x,y,'b = 1, m = 1, k = 1');
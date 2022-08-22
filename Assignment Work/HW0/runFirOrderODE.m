% Solve ODE using MATLAB's ode45

t0 = 0;
x0 = 0; 
tEnd = 5;

%% Solving using ode45

[tSol, xSol] = ode45(@(t,x) FirstOrderODEfunc(t,x), [t0, tEnd], x0);

%% Plot results

plot(tSol, xSol(:, 1), '-o')
title('Solving First-order ODE using ode45')
xlabel('Time [sec]')
ylabel('x(t)')
%yyaxis('left');
ylim([0,10]); % Play with 10 until it looks good
yticks(0:10);
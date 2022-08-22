function ydot = bounce(t, y)

ydot(1) = y(2); % velocity
ydot(2) = -9.8; % acceleration
ydot = ydot';
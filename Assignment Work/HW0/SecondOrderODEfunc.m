function xdot = SecondOrderODEfunc(t,x)

b = 1;
m = 1;
k = 1;

xdot(1) = x(2);
xdot(2) = -(b/m)*x(2) - (k/m)*x(1);
xdot = xdot';
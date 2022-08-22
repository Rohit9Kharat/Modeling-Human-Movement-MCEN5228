clc; clear;

theta = linspace(-pi/6,pi/6,10);

Y_diff = -(sin(theta).*(20 - (19.62.*cos(theta))).^0.5);

X_diff = (cos(theta).*(20 - (19.62.*cos(theta))).^0.5);

Pot_eng = 9.81*cos(theta);

Kin_eng = (cos(theta).^2.*(20 - 19.62.*cos(theta)))/2;

plot(theta, Y_diff);
ylabel('Vertical Velocity (m/s)')
xlabel('Vertical Angle (radians)')
title('Vertical Velocity vs Vertical Angle')

figure
plot(theta, X_diff);
ylabel('Forward Velocity (m/s)')
xlabel('Vertical Angle (radians)')
title('Forward Velocity vs Vertical Angle')

figure
plot(theta, Pot_eng);
ylabel('Potential Energy (Joules)')
xlabel('Vertical Angle (radians)')
title('Gravitational Potential Energy vs Vertical Angle')

figure
plot(theta, Kin_eng);
ylabel('Kinetic Energy (Joules)')
xlabel('Vertical Angle (radians)')
title('Forward Kinetic Energy vs Vertical Angle')



%v = -5:0.2:5;
v = 0:0.01:5;
a = 14.35; % gram weight
b = 1.03; % cm/sec
F_0 = a/0.22;

F_v = (b*F_0 - a*v)./(v + b);
%F_v = (1.03 - 0.22*v)*65.23./(v + 1.03);

P = (b*F_0*v - a*v.*v)./(v + b);


plot(v, F_v);
ylabel('Force (gm wt)');
xlabel('Muscle Fiber Velocity (cm/s)');
title('Force-Velocity curve');
[x1,y1] = ginput;
text(x1,y1,'a=14.35 gm wt')
hold
[x2,y2] = ginput;
text(x2,y2,'b=1.03 cm/s');
hold
[x3,y3] = ginput;
text(x3,y3,'a/F0=0.22');

hold

figure;
plot(v, P);
ylabel('Power (erg per sec)');
xlabel('Muscle Fiber Velocity (cm/s)');
title('Power-Velocity curve');
[x1,y1] = ginput;
text(x1,y1,'a=14.35 gm wt')
hold
[x2,y2] = ginput;
text(x2,y2,'b=1.03 cm/s');
hold
[x3,y3] = ginput;
text(x3,y3,'a/F0=0.22');



%%
 F_v = -5:0.1:5;
 
 v = (0.0103*(0.639 - F_v))./(F_v + 0.14063);
 
 plot(v, F_v);
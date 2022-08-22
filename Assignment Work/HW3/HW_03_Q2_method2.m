
clc; clear;

w = 0.5;
af = 0.25;

muscle_vol = 600; % cm3
stress_iso_peak = 0.3*10^6*10^-4; % N/cm2

force_iso_max_a = 1800; % N
force_iso_max_b = 900; % N

%PCSA_a = force_iso_max_a/stress_iso_peak; % cm2
%PCSA_b = force_iso_max_b/stress_iso_peak; % cm2

l_n = 0:0.01:2;

%len_opt_a = muscle_vol/PCSA_a; % cm
%len_opt_b = muscle_vol/PCSA_b; % cm

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Selecting optimal length

len_opt_a = 5;
len_opt_b = 10;

PCSA_a = muscle_vol/len_opt_a;
PCSA_b = muscle_vol/len_opt_b;

%l_n = len_range/len_opt;

len_range_a = l_n*len_opt_a;
len_range_b = l_n*len_opt_b;

v_max_a = 3*len_opt_a;
v_max_b = 3*len_opt_b;

v_n = 0:0.01:2;

%v_n = len_range/v_max;

vel_range_a = v_max_a*v_n;
vel_range_b = v_max_b*v_n;

f_l = 1 - ((l_n - 1)./w).^2;
f_l(f_l<0) = 0;

subplot(2,2,1)
plot(len_range_a, force_iso_max_a*f_l)
ylabel('Force (N)')
xlabel('Active Length (cm)')
title('Strong-ilias Force-Length curve')
grid on

subplot(2,2,2)
plot(len_range_b, force_iso_max_b*f_l)
ylabel('Force (N)')
xlabel('Active Length (cm)')
title('Stretch-ilias Force-Length curve')
grid on

f_v = (1 - v_n)./(1 + (v_n/af));

subplot(2,2,3)
f_v(f_v<0) = 0;
plot(vel_range_a, force_iso_max_a*f_v);
ylabel('Force (N)')
xlabel('Velocity (cm/s)')
title('Strong-ilias Force-Velocity curve')
grid on

subplot(2,2,4)
f_v(f_v<0) = 0;
plot(vel_range_b, force_iso_max_b*f_v);
ylabel('Force (N)')
xlabel('Velocity (cm/s)')
title('Stretch-ilias Force-Velocity curve')
suptitle('Method-2 (Selection)')
grid on

figure
hold on
%subplot(1,2,1)
H1 = plot(vel_range_a, force_iso_max_a*f_v.*vel_range_a*10^-2);
H2 = plot(vel_range_b, force_iso_max_b*f_v.*vel_range_b*10^-2);
ylabel('Power (Watt)')
xlabel('Velocity (cm/s)')
xlim([0 40])
legend([H1 H2],{'Strong-ilias', 'Stretch-ilias'})
title('Method-2 (Selection)')
grid on

hold off


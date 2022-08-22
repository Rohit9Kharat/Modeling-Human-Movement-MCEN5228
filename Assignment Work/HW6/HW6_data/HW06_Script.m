clear;clc;

% Loading mat files
load('constants.mat');
load('kinematic_data.mat')
load('force_data.mat');

% Calling the function Prob2 to get desired outputs
[T1, T2, T3, err_Fx_3, err_Fy_3, err_T3] = HW06_Function(theta1,theta2,thetadot1,thetadot2,thetadotdot1,thetadotdot2,GRF_hori,GRF_vert);  

% Necessary moment arms of muscles
ham_hip_ext_mom_arm = 0.05; % in m
ham_knee_flex_mom_arm = 0.04; % in cm
vasti_knee_ext_mom_arm = 0.04; % in cm
soleus_ankle_ext_mom_arm = 0.025; % in cm

% Forces calculated in the hamstrings, vasti, and soleus muscles
F_ham_hip_ext = -T3/ham_hip_ext_mom_arm;
F_ham_knee_flex = T2./ham_knee_flex_mom_arm;
F_vasti_knee_ext = (T2+F_ham_knee_flex*ham_knee_flex_mom_arm)/vasti_knee_ext_mom_arm;
F_soleus_ankle_ext = -T1/soleus_ankle_ext_mom_arm;

% Accounting for only positive muscle forces
F_ham_hip_ext = F_ham_hip_ext(F_ham_hip_ext>=0);
index1 = find(F_ham_hip_ext>=0);

F_ham_knee_flex = F_ham_knee_flex(F_ham_knee_flex>=0);
index2 = find(F_ham_knee_flex>=0);

F_vasti_knee_ext = F_vasti_knee_ext(F_vasti_knee_ext>=0);
index3 = find(F_vasti_knee_ext>=0);

F_soleus_ankle_ext = F_soleus_ankle_ext(F_soleus_ankle_ext>=0);
index4 = find(F_soleus_ankle_ext>=0);

% Plots of Net Joint Torques at Ankle, Knee and Hip
plot(time, T1)
hold on
plot(time, T2)
hold on
plot(time, T3)
xlabel('Time (seconds)')
ylabel('Net Joint Torques (Newton-m)')
h1 = legend('T1: Ankle', 'T2: Knee', 'T3: Hip');
rect = [0.15, 0.60, .30, .30];
set(h1, 'Position', rect);
title('Net Joint Torque vs Time')
grid on

% Plot of error in Fx_3 and Fy_3
figure  
plot(time, err_Fx_3)
hold on
plot(time, err_Fy_3)
xlabel('Time (seconds)')
ylabel('Error (Newton)')
title('Error in component of forces vs Time')
legend('Error in Fx_3', 'Error in Fy_3')
grid on


% Plot for error in Net Joint Torque at Hip
figure
plot(time, err_T3)
xlabel('Time (seconds)')
ylabel('Error (Newton-m)')
title('Error in T3 vs Time')
grid on

% Plot of forces developed in muscles
figure
plot(time(index1), F_ham_hip_ext)
hold on
plot(time(index2), F_ham_knee_flex)
hold on
plot(time(index3), F_vasti_knee_ext)
hold on
plot(time(index4), F_soleus_ankle_ext)
xlabel('Time (seconds)')
ylabel('Force (Newton)')
h2 = legend('Hamstring Hip Extension','Hamstring Knee Flexion','Vasti Knee Extension','Soleus Ankle Extension');
rect = [0.15, 0.60, .30, .30];
set(h2, 'Position', rect);
title('Muscle Force vs Time')
grid on





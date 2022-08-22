clear;clc;

% Loading mat files
load('constants.mat');
load('kinematic_data.mat')
load('force_data.mat');

% Calling the function Prob2 to get desired outputs
[T1, T2, T3, err_Fx_3, err_Fy_3, err_T3] = Prob2(theta1,theta2,thetadot1,thetadot2,thetadotdot1,thetadotdot2,GRF_hori,GRF_vert);  

% Necessary moment arms of muscles
ham_hip_ext_mom_arm = 5; % in cm
ham_knee_flex_mom_arm = 4; % in cm
vasti_knee_ext_mom_arm = 4; % in cm
soleus_ankle_ext_mom_arm = 2.5; % in cm

% Forces calculated in the hamstrings, vasti, and soleus muscles
F_ham_hip_ext = T3*ham_hip_ext_mom_arm;
F_ham_knee_flex = T2*ham_knee_flex_mom_arm;
F_vasti_knee_ext = T2*vasti_knee_ext_mom_arm;
F_soleus_ankle_ext = T1*soleus_ankle_ext_mom_arm;

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
ylabel('Net Joint Torques ()')
h1 = legend('T1: Ankle', 'T2: Knee', 'T3: Hip');
rect = [0.15, 0.60, .30, .30];
set(h1, 'Position', rect);
title('Net Joint Torque vs Time')

% Plot of error in Fx_3
figure  
plot(time, err_Fx_3)
xlabel('Time (seconds)')
ylabel('Error (Newton)')
title('Error in Fx_3 vs Time')

% Plot of error in Fy_3
figure
plot(time, err_Fy_3)
xlabel('Time (seconds)')
ylabel('Error (Newton)')
title('Error in Fy_3 vs Time')

% Plot for error in Net Joint Torque at Hip
figure
plot(time, err_T3)
xlabel('Time (seconds)')
ylabel('Error ()')
title('Error in T3 vs Time')

% Plot of Forces developed in Hamstrings
figure
plot(time(index1), F_ham_hip_ext)
hold on
plot(time(index2), F_ham_knee_flex)
xlabel('Time (seconds)')
ylabel('Hamstring Force (Newton)')
h2 = legend('Hamstring Hip Extension', 'Hamstring Knee Flexion');
rect = [0.15, 0.60, .30, .30];
set(h2, 'Position', rect);
title('Hamstring Force vs Time')

% Plot of Forces developed in Vasti
figure
plot(time(index3), F_vasti_knee_ext)
xlabel('Time (seconds)')
ylabel('Vasti Knee Extension Force (Newton)')
title('Vasti Knee Extension Force vs Time')

% Plot of Forces developed in Soleus
figure
plot(time(index4), F_soleus_ankle_ext)
xlabel('Time (seconds)')
ylabel('Soleus Ankle Extension Force (Newton)')
title('Soleus Ankle Extension Force vs Time')




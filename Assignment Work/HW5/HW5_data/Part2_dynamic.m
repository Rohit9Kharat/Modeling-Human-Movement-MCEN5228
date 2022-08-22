% This code is for conducting dynamic trials

%%
clc;clear;
load('dynamic_trial.mat')

%%
%%%%%%%%%%%%%%%%% Problem 7

% Loading the saved variable file
load('partc')

% Initialization of vectors of knee joint angles
flex_extn_angle_phi = zeros(247,1);
varus_valgus_angle_theta = zeros(247,1);
int_ext_psi = zeros(247,1);

% for loop for generating the transformation matrices over the time step
for i = 1:length(time)
    
    % Declaration of variables for thigh
    o_lcsthigh = T2(i, :);
    x_lcsthigh = (T1(i, :) - T2(i, :))/norm(T1(i, :) - T2(i, :));
    y_lcsthigh = cross((T3(i, :) - T2(i, :)), x_lcsthigh)/norm(cross((T3(i, :) - T2(i, :)), x_lcsthigh));
    z_lcsthigh = cross(x_lcsthigh, y_lcsthigh)/norm(cross(x_lcsthigh, y_lcsthigh));
    
    R_lcs_gcs_thigh = [x_lcsthigh' y_lcsthigh' z_lcsthigh'];

    % Transformation matrix from LCS to GCS for thigh at each time step
    T_lcs_gcs_thigh = [R_lcs_gcs_thigh o_lcsthigh'; [0 0 0] 1];

    % Declaration of variables for shank
    o_lcsshank = S2(i, :);
    x_lcsshank = (S1(i, :) - S2(i, :))/norm(S1(i, :) - S2(i, :));
    y_lcsshank = cross((S3(i, :) - S2(i, :)), x_lcsshank)/norm(cross((S3(i, :) - S2(i, :)), x_lcsshank));
    z_lcsshank = cross(x_lcsshank, y_lcsshank)/norm(cross(x_lcsshank, y_lcsshank));
    
    R_lcs_gcs_shank = [x_lcsshank' y_lcsshank' z_lcsshank'];

    % Transformation matrix from LCS to GCS for shank at each time step
    T_lcs_gcs_shank = [R_lcs_gcs_shank o_lcsshank'; [0 0 0] 1];
    
    % Transformation matrix from ACS shank to ACS thigh at each time step
    T_acsshank_acsthigh = inv(T_acs_lcs_thigh)*inv(T_lcs_gcs_thigh)*T_lcs_gcs_shank*T_acs_lcs_shank;
   
    %%%% Joint Angles
    
    flex_extn_angle_phi(i) = atan2d(T_acsshank_acsthigh(3,2), T_acsshank_acsthigh(3,3));
    varus_valgus_angle_theta(i) = atan2d(-T_acsshank_acsthigh(3,1), sqrt(T_acsshank_acsthigh(1,1)^2 + T_acsshank_acsthigh(2,1)));
    int_ext_psi(i) = atan2d(T_acsshank_acsthigh(2,1), T_acsshank_acsthigh(1,1));
    
    
end

%%
%%%%%%%%%%%%%%%%%%% Problem 8

% Plotting the Knee Joint Angles vs Time

plot(time, flex_extn_angle_phi)
xlabel('Time (seconds)')
ylabel('Knee Joint Angles (degrees)')
hold on
plot(time, varus_valgus_angle_theta)
plot(time, int_ext_psi)
title('Knee Joint Angles vs Time')

h = legend('flexion/extension', 'varus/valgus', 'internal/rotation');
rect = [0.15, 0.15, .30, .30];
set(h, 'Position', rect)



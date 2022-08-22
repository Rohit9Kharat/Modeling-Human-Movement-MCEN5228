% This code is for conducting static trials

%%
clc;clear;
load('static_trial.mat')

%%%%%%%%%%%%%%%% Problem 1

o_lcsshank = S2; % marker S2 as the LCS origin
x_lcsshank = (S1 - S2)/norm(S1 - S2); % x-axis directed from marker S2 to S1
y_lcsshank = cross((S3 - S2), x_lcsshank)/norm(cross((S3 - S2), x_lcsshank)); % y-axis
z_lcsshank = cross(x_lcsshank, y_lcsshank)/norm(cross(x_lcsshank, y_lcsshank)); % z-axis

R_lcs_gcs_shank = [x_lcsshank' y_lcsshank' z_lcsshank']; % Rotation matrix of LCS shank

% Transformation matrix that expresses LCS of shank wrt GCS
disp('Transformation matrix that expresses LCS of shank wrt GCS')
T_lcs_gcs_shank = [R_lcs_gcs_shank o_lcsshank'; [0 0 0] 1]

%%
%%%%%%%%%%%%%%% Problem 2

o_acsshank = (LAT_KNEE + MED_KNEE)/2; % origin of ACS shank
mid_ankle = (LAT_ANKLE + MED_ANKLE)/2;
z_acsshank = (mid_ankle - o_acsshank)/norm(mid_ankle - o_acsshank); % z-axis
y_acsshank = cross((MED_KNEE - LAT_KNEE), z_acsshank)/norm(cross((MED_KNEE - LAT_KNEE), z_acsshank)); % y-axis
x_acsshank = cross(z_acsshank, y_acsshank)/norm(cross(z_acsshank, y_acsshank)); % x-axis

R_acs_gcs_shank = [x_acsshank' y_acsshank' z_acsshank']; % Rotation matrix of ACS shank

% Transformation matrix that expresses ACS of shank wrt GCS
disp('Transformation matrix that expresses ACS of shank wrt GCS')
T_acs_gcs_shank = [R_acs_gcs_shank o_acsshank'; [0 0 0] 1]

%%
%%%%%%%%%%%%%%%% Problem 3

o_lcsthigh = T2; % origin of LCS thigh
x_lcsthigh = (T1 - T2)/norm(T1 - T2); % x-axis
y_lcsthigh = cross((T3 - T2), x_lcsthigh)/norm(cross((T3 - T2), x_lcsthigh)); % y-axis
z_lcsthigh = cross(x_lcsthigh, y_lcsthigh)/norm(cross(x_lcsthigh, y_lcsthigh)); % z-axis

R_lcs_gcs_thigh = [x_lcsthigh' y_lcsthigh' z_lcsthigh']; % Rotation matrix of LCS thigh

% Transformation matrix that expresses LCS of thigh wrt GCS
disp('Transformation matrix that expresses LCS of thigh wrt GCS')
T_lcs_gcs_thigh = [R_lcs_gcs_thigh o_lcsthigh'; [0 0 0] 1]

%%
%%%%%%%%%%%%%%%% Problem 4

o_acsthigh = (ASIS + PSIS)/2; % origin of ACS thigh
mid_knee = (LAT_KNEE + MED_KNEE)/2;
z_acsthigh = (mid_knee - o_acsthigh)/norm(mid_knee - o_acsthigh); % z-axis
y_acsthigh = cross((MED_KNEE - LAT_KNEE), z_acsthigh)/norm(cross((MED_KNEE - LAT_KNEE), z_acsthigh)); % y-axis
x_acsthigh = cross(z_acsthigh, y_acsthigh)/norm(cross(z_acsthigh, y_acsthigh)); % x-axis

R_acs_gcs_thigh = [x_acsthigh' y_acsthigh' z_acsthigh']; % Rotation matrix of ACS thigh

% Transformation matrix that expresses ACS of thigh wrt GCS
disp('Transformation matrix that expresses ACS of thigh wrt GCS')
T_acs_gcs_thigh = [R_acs_gcs_thigh o_acsthigh'; [0 0 0] 1]

%%
%%%%%%%%%%%%%%%%% Problem 5

% Transformation matrix that expresses ACS of shank with respect to the LCS of shank
disp('Transformation matrix that expresses ACS of shank with respect to the LCS of shank')
T_acs_lcs_shank = inv(T_lcs_gcs_shank)*T_acs_gcs_shank

%save('T_acs_lcs_shank')

%%
%%%%%%%%%%%%%%%%% Problem 6

% Transformation matrix that expresses ACS of thigh with respect to the LCS of thigh
disp('Transformation matrix that expresses ACS of thigh with respect to the LCS of thigh')
T_acs_lcs_thigh = inv(T_lcs_gcs_thigh)*T_acs_gcs_thigh

% Saving the variables for using in dynamic trials
save('partc', "T_acs_lcs_shank", "T_acs_lcs_thigh")


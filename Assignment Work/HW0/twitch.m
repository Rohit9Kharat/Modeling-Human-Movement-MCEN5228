function twitch
% twitch.m 
clear all
close all

% function referred to:
%   activationDynamics   state-derivative function for excitation dynamics


% Parameters of a muscle excitation pulse train
pulseSeparation = [2.0, 0.2]; % FILL IN;    % separation between pulses (in sec)
pulseDuration   = 0.12; % FILL IN;    % duration of pulses, delivered as square waves

pulseAmplitude  = 1;            % twitches go between 0 and 1 

% Parameters of activation dynamics
tauActivation   = 0.12; % FILL IN;    % activation time constant
tauDeactivation = 0.24; % FILL IN;    % deactivation time constant (about 5 times slower)


%% Excitation Function (u(t))
% provides the excitation input waveform as function of time.
% the example below is just a rectangular pulse train, which
% could be replaced with arbitrary inputs.

% initialize
tvec=0:0.0001:3;                    %time vector
ufun=zeros(1,length(tvec));         %excitation
twitchcount = zeros(1,length(tvec));%number of twitches
j=0;                                %running counter of twitches

startTime = 0.0; %Start at an arbitrary time

for k in pulseSeparation
    for i=1:length(tvec)
        if tvec(i) > (startTime + pulseSeparation*j) && ...
         tvec(i) < (startTime + pulseDuration + pulseSeparation*j) 
            ufun(i) = pulseAmplitude;             %twitch
        elseif tvec(i)> startTime && ufun(i-1)==pulseAmplitude
            j=j+1;   %twitch is over and update twitch count function
        end
        twitchcount(i)=j;   %running twitch count function
    end

%% EDIT THIS CELL to recreate the excitation in the homework figures and plot the resulting activation

numTwitches = 2;  % How many times to apply twitches
[t1,y1] = ode45(@activationDynamics, tvec, [0]);
figure(1)
plot(t1,y1); ylabel('activation'); legend('2 twitch'); title('Twitches');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Activation Dynamics
% Note that for muscle fibers in isometric condition, the force produced
% will be proportional to the activation

function adot = activationDynamics(t,a)
% provides state derivative for excitation dynamics of muscle
% where a is activation (between 0 and 1), and t is time

u=0;
%interpolate total twitch count function
twcount=interp1(tvec,twitchcount,t); %twitchcount=f(tvec)

%determine if still need more twitches
if twcount < numTwitches
    u = interp1(tvec,ufun,t);  
end

% Activation dynamics
adot = -a*(((1-u)/tauDeactivation) + (u/tauActivation)) + (u/tauActivation);% FILL IN with muscle activation equation

end



end % main twitch function

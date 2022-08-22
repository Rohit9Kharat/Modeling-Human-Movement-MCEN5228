function [position,isterminal,direction] = appleEventsFcn(t,S)
position = S(2); % The value that we want to be zero
isterminal = 1;  % Halt integration 
direction = 0;   % The zero can be approached from either direction
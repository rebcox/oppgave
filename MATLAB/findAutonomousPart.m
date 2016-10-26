function [ s_auto, data_auto ] = findAutonomousPart( s, data )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%Trigger at 4th column is autonomous
trigger4 = find(s(:,4)==1 , 8);
endOfAuto = trigger4(8)+400;

data_auto = data(trigger4(1):endOfAuto, :);
s_auto = s(trigger4(1):endOfAuto, :);

end


%% DEMO 26.10.16
clear
clc

%% 
gatherDodForTypesOfMotion;

%% Plot change in optical density for different movements
step = 1/fs;
seconds = 10;
x=0:step:(seconds-step);

figure('Name', 'Error plot: Change in OD, looking left', 'NumberTitle','off')
shadedErrorBar(x,mean(dodLeft,1),std(dodLeft),'g');
figure('Name', 'Error plot: Change in OD, looking right', 'NumberTitle','off')
shadedErrorBar(x,mean(dodRight,1),std(dodRight),'b');

%%
gatherHboForTypesOfMotion;

%% Plot change in HbO density for different movements

figure('Name', 'Error plot: Change in HbO, looking left', 'NumberTitle','off')
shadedErrorBar(x,mean(hboLeft,1),std(hboLeft),'r');
figure('Name', 'Error plot: Change in HbO, looking right', 'NumberTitle','off')
shadedErrorBar(x,mean(hboRight,1),std(hboRight),'c');

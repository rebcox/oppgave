%% Plot shaded error bar for Dod and Hbo for channel 13
clear
clc

loadWorkspaceForOneChannel;

%% Plot change in optical density for different movements
step = 1/fs;
seconds = 10;
x=0:step:(seconds-step);

figure('Name', 'Error plot: Change in OD, yawn', 'NumberTitle','off')
shadedErrorBar(x,mean(dodYawn,1),std(dodYawn),'g');
noLeft = size(dodLeft,1)
% figure('Name', 'Error plot: Change in OD, looking right', 'NumberTitle','off')
% shadedErrorBar(x,mean(dodRight,1),std(dodRight),'b');
% noRight = size(dodRight,1)

%% Plot change in HbO density for different movements

figure('Name', 'Error plot: Change in HbO, looking left', 'NumberTitle','off')
shadedErrorBar(x,mean(hboLeft,1),std(hboLeft),'r');
figure('Name', 'Error plot: Change in HbO, looking right', 'NumberTitle','off')
shadedErrorBar(x,mean(hboRight,1),std(hboRight),'c');

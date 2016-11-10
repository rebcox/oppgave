noFrames = 20;
noChannels = 7;
randomNumber = round((18859-noFrames)*rand(1));
dodRandom = zeros(noChannels,20);
startFrame = randomNumber;
endFrame = startFrame + noFrames - 1;
%a = [5 7 11 12 18 19 20]; %artifact1;
%a = [1 2 3 11 12 19 20]; %artifact11
a= [1:20];
for i=1:noChannels
    dodRandom(i,:) =  dod(startFrame:endFrame, a(i)) - mean(dod(startFrame:endFrame, a(i)));
end
x=1:noFrames;

figure('Name', 'Error plot: dod, random interval', 'NumberTitle','off')
shadedErrorBar(x,mean(dodRandom,1),std(dodRandom),'g');
axis([-Inf Inf -0.03 0.03])

stdRandom = std(dodRandom)
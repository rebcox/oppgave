function plotAllChannelsOnRightMotion( hbo , motions, noFrames, fs, s)
%Make subplots of all channels for every right motion

[leftTs, rightTs, ~ , ~, ~] = sortMotions(motions);
noChannels = size(hbo,2);
noMotions = size(rightTs,1);
hboRightAllChannels = zeros(noMotions,noFrames,noChannels);

counter = 1;
for i=1:noMotions
    startFrame = rightTs(i);
    if frameIsSecondsFromStimLine(20,startFrame,fs,s)
        endFrame = startFrame + noFrames - 1;
        hboRightAllChannels(counter,:,:) = hbo(startFrame:endFrame, :);
        counter = counter + 1;
    end
end

noMotions = counter - 1;
x=[0:1/fs:(10-1/fs)];
for i=1:noMotions
    %figure('Name', 'Look right');
    for j=1:noChannels
        subplot(5,4,j)
        hold on

        hboRightPlot = plot(x, hboRightAllChannels(i,:,j));
    end
end

% h = get(0,'children');
% for i=1:length(h)
%   saveas(h(i), ['motion' num2str(i)], 'fig');
% end
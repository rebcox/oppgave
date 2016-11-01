function dataforFrames = findDataForTimeframes(timeframes, data, noFrames, fs, s, channel)

dataforFrames = zeros(size(timeframes,1), noFrames);

counter = 1;
for i=1:size(timeframes,1)
    startFrame = timeframes(i);
    if frameIsSecondsFromStimLine(20,startFrame,fs,s)
        endFrame = startFrame + noFrames - 1;
        dataforFrames(counter,:) = data(startFrame:endFrame, channel); 
        counter = counter + 1;
    end
end
dataforFrames = dataforFrames(1:counter-1,:);
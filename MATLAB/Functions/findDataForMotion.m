function dataMotion = findDataForMotion(motionTs, data, noFrames, fs, s, channel)

dataMotion = zeros(size(motionTs,1), noFrames);

counter = 1;
for i=1:size(motionTs,1)
    startFrame = motionTs(i);
    if frameIsSecondsFromStimLine(20,startFrame,fs,s)
        endFrame = startFrame + noFrames - 1;
        dataMotion(counter,:) = data(startFrame:endFrame, channel); 
        counter = counter + 1;
    end
end
dataMotion = dataMotion(1:counter-1,:);
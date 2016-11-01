function [dataRight, dataLeft, dataDown, dataUp, dataYawn] = splitDataToMotionArraysOnOneChannel(data,motions,fs,channel,s)


%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
[leftTs, rightTs, downTs, upTs, yawnTs] = sortMotionTimestamps(motions);
noFrames = floor(10*fs);

dataLeft = findDataForTimeframes(leftTs, data, noFrames, fs, s, channel);
dataRight = findDataForTimeframes(rightTs, data, noFrames, fs, s, channel);
dataDown = findDataForTimeframes(downTs, data, noFrames, fs, s, channel);
dataUp = findDataForTimeframes(upTs, data, noFrames, fs, s, channel);
dataYawn = findDataForTimeframes(yawnTs, data, noFrames, fs, s, channel);

%This script makes five lists; hboRight, hboLeft, hboDown, hboUp, hboYawn.
%These lists will consist of 20s hbo-data for channel 13 for the timestamps
%in leftTs, rightTs, downTs, upTs, yawnTs from sortMotions()
nirsFile =  'cw012.nirs';
load(nirsFile,'-mat');

dod = hmrIntensity2OD(d);
ScripttoChangeTimeStamps();
readMotionFile; %this should return motions, not just add it to workspace
fs = 1/(t(2)-t(1));  % sampling frequency of the data

motionsNoOverlap = removeOverlappingMotions(10,motions,fs);

%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
[leftTs, rightTs, downTs, upTs, yawnTs] = sortMotions(motionsNoOverlap);
noFrames = floor(10*fs);

channel = 13;
dodLeft = findDataForMotion(leftTs, dod, noFrames, fs, s, channel);
dodRight = findDataForMotion(rightTs, dod, noFrames, fs, s, channel);
dodDown = findDataForMotion(downTs, dod, noFrames, fs, s, channel);
dodUp = findDataForMotion(upTs, dod, noFrames, fs, s, channel);
dodYawn = findDataForMotion(yawnTs, dod, noFrames, fs, s, channel);

save dodSortedByMotion dodLeft dodRight dodDown dodUp dodYawn
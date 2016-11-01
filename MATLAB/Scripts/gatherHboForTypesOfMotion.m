%This script makes five lists; hboRight, hboLeft, hboDown, hboUp, hboYawn.
%These lists will consist of 20s hbo-data for channel 13 for the timestamps
%in leftTs, rightTs, downTs, upTs, yawnTs from sortMotions()
nirsFile =  'cw012.nirs';
load(nirsFile,'-mat');

dod = hmrIntensity2OD(d);
ScripttoChangeTimeStamps();
ppf = [6 6]; % partial pathlength factors for each wavelength.
fs = 1/(t(2)-t(1));  % sampling frequency of the data
[hbo, hbr, hbt] = convertToConcentratrions(dod, SD, ppf);

motionsNoOverlap = removeOverlappingMotions(10,motions,fs);

%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
[leftTs, rightTs, downTs, upTs, yawnTs] = sortMotionTimestamps(motionsNoOverlap);
noFrames = floor(10*fs);

channel = 13;
hboLeft = findDataForMotion(leftTs, hbo, noFrames, fs, s, channel);
hboRight = findDataForMotion(rightTs, hbo, noFrames, fs, s, channel);
hboDown = findDataForMotion(downTs, hbo, noFrames, fs, s, channel);
hboUp = findDataForMotion(upTs, hbo, noFrames, fs, s, channel);
hboYawn = findDataForMotion(yawnTs, hbo, noFrames, fs, s, channel);

save hboSortedByMotion hboLeft hboRight hboDown hboUp hboYawn
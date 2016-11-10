%This script makes ten lists:
% - dodRight, dodLeft, dodDown, dodUp, dodYawn
% - hboRight, hboLeft, hboDown, hboUp, hboYawn

channel = 1;

nirsFile =  'cw025.nirs';
load(nirsFile,'-mat');
ppf = [6 6]; % partial pathlength factors for each wavelength.
fs = 1/(t(2)-t(1));  % sampling frequency of the data

dod = hmrIntensity2OD(d);
[hbo, hbr, hbt] = convertToConcentrations(dod, SD, ppf);
ScripttoChangeTimeStamps();
readMotionFile; %this should return motions, not just add it to workspace

motionsNoOverlap = removeOverlappingMotions(10,motions,fs);

[dodRight, dodLeft, dodDown, dodUp, dodYawn] = ...
    splitDataToMotionArraysOnOneChannel(dod,motionsNoOverlap,fs,channel,s);

[hboRight, hboLeft, hboDown, hboUp, hboYawn] = ...
    splitDataToMotionArraysOnOneChannel(hbo,motionsNoOverlap,fs,channel,s);

%save dodSortedByMotion dodLeft dodRight dodDown dodUp dodYawn
%save hboSortedByMotion hboLeft hboRight hboDown hboUp hboYawn
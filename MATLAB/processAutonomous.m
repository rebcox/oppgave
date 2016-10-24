clear;
clc;
nirsFile =  'cw012.nirs';
load(nirsFile,'-mat');
%Variables
fs = 1/(t(2)-t(1));  % sampling frequency of the data
lpf = 0.5; % in Hz for bandpass filter
hpf = 0.01; % in Hz for bandpass filter
ppf = [6 6]; % partial pathlength factors for each wavelength.

%coverting the wavelength data to delta Optical Density
dod = hmrIntensity2OD(d);
ScripttoChangeTimeStamps();
readMotionFile;
[s_auto, dod_auto] = findAutonomousPart(s,dod);
%%
%*******Plot delta optical density without bandpass filter*******%
%magnitude = max(max(dod_auto));
magnitude = 0.15;
plotDataWithMotion(dod_auto, motions, s_auto, magnitude, false, 'DOD without bandpass filter');

%% 
%*******Plot concentration without bandpass filter*******%
[hbo, hbr, hbt] = convertToConcentratrions(dod_auto, SD, ppf);
%[s_auto, hbo_auto] = findAutonomousPart(s,hbo);
%magnitude = max(max(dod_auto));
magnitude = 0.00004;
plotDataWithMotion(hbo, motions, s_auto, magnitude, false, 'Concentration without bandpass filter');

%%
%*******Band-pass filtering*******%
dod_auto_filt = hmrBandpassFilt(dod_auto, fs, hpf, lpf);

%%
%*******Plot delta optical density after bandpass filter*******%
%magnitude = max(max(dod_auto_filt));
magnitude = 0.15;
plotDataWithMotion(dod_auto_filt, motions, s_auto, magnitude, false, 'OD after bandpass filter');

%%
%*******Plot concentration with bandpass filter*******%
[hbo_filt, hbr_filt, hbt_filt] = convertToConcentratrions(dod_auto_filt, SD, ppf);
%[s_auto, hbo_auto_filt] = findAutonomousPart(s,hbo_filt);
%magnitude = max(max(dod_auto));
magnitude = 0.00003;
plotDataWithMotion(hbo_filt, motions, s_auto, magnitude, false, 'Concentration after bandpass filter');

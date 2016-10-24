function processFrames(frames)

startFrame = frames(1);
endFrame = frames(2);
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

dod_selected = dod(startFrame:endFrame, :);
save dod_selected
s_selected = s(startFrame:endFrame, :); 

magnitude = 0.15;
plotDataWithMotion(dod_selected, motions, s_selected, magnitude, true, 'DOD without bandpass filter');

end
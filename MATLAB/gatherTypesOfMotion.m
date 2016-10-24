
dod = hmrIntensity2OD(d);
ScripttoChangeTimeStamps();
ppf = [6 6]; % partial pathlength factors for each wavelength.
fs = 1/(t(2)-t(1));  % sampling frequency of the data
[hbo, hbr, hbt] = convertToConcentratrions(dod, SD, ppf);

lookRightTimeStamps = sortMotions();
noRight = size(lookRightTimeStamps,1);
noFrames = floor(10*fs);
hboRight=zeros(noRight, noFrames);
for i=1:noRight
    startFrame = lookRightTimeStamps(i);
    endFrame = startFrame + noFrames - 1;
    hboRight(i,:) = hbo(startFrame:endFrame, 13); %channel 13
end
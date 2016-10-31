nirsFile =  'cw012.nirs';
load(nirsFile,'-mat');

dod = hmrIntensity2OD(d);
ScripttoChangeTimeStamps();
ppf = [6 6]; % partial pathlength factors for each wavelength.
fs = 1/(t(2)-t(1));  % sampling frequency of the data
[hbo, hbr, hbt] = convertToConcentratrions(dod, SD, ppf);

randNumbers = round((18859-79)*rand(9,1));
noFrames = floor(10*fs);
hboRandom = zeros(9,78);

for i=1:9
    interval = b(i,:);
    startFrame = randNumbers(i);
    endFrame = startFrame + noFrames - 1;
    hboRandom(i,:) =  hbo(startFrame:endFrame, 13);
end

step = 1/fs;
seconds = 10;
x=0:step:(seconds-step);

figure('Name', 'Error plot: Change in OD, random interval', 'NumberTitle','off')
shadedErrorBar(x,mean(hboRandom,1),std(hboRandom),'g');
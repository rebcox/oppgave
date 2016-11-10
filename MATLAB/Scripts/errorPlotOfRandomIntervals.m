nirsFile =  'cw012.nirs';
load(nirsFile,'-mat');

dod = hmrIntensity2OD(d);
ScripttoChangeTimeStamps();
ppf = [6 6]; % partial pathlength factors for each wavelength.
fs = 1/(t(2)-t(1));  % sampling frequency of the data
[hbo, hbr, hbt] = convertToConcentrations(dod, SD, ppf);

noNumbers = 9;
randNumbers = round((18859-79)*rand(noNumbers,1));
noFrames = floor(10*fs);
hboRandom = zeros(noNumbers,78);

for i=1:noNumbers
    startFrame = randNumbers(i);
    endFrame = startFrame + noFrames - 1;
    hboRandom(i,:) =  hbo(startFrame:endFrame, 13);
end

step = 1/fs;
seconds = 10;
x=0:step:(seconds-step);

figure('Name', 'Error plot: HbO, random interval', 'NumberTitle','off')
shadedErrorBar(x,mean(hboRandom,1),std(hboRandom),'g');
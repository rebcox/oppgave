%function chooseFramesToDisplay()
%Script to find out what frames to plot
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
    %dod_auto_filt = hmrBandpassFilt(dod_auto, fs, hpf, lpf);
    dod_auto_filt = dod_auto;
    %*******Plot concentration with bandpass filter*******%
    [hbo_filt, ~, ~] = convertToConcentratrions(dod_auto_filt, SD, ppf);
    %[s_auto, hbo_auto_filt] = findAutonomousPart(s,hbo_filt);

    magnitude = 0.00003;
    plotDataWithMotion(hbo_filt, motions, s_auto, magnitude, false, 'Concentration after bandpass filter');

    % Create push button
    btn = uicontrol('Style', 'pushbutton', 'String', 'Choose frames',...
        'Position', [20 20 100 20], 'Callback', @getInput);  
%end
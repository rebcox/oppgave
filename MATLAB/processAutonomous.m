clear all;
clc;
nirsFile =  'cw012.nirs';
%
load(nirsFile,'-mat');
%% 
% coverting the wavelength data to Optical Density
dod = hmrIntensity2OD(d);

% This is the time to run the script that changes the time stamps from the
% original format to what is actually needed.
ScripttoChangeTimeStamps();

%%
% Band-pass filtering
fs = 1/(t(2)-t(1));  % sampling frequency of the data
lpf = 0.5; % in Hz
hpf = 0.01; % in Hz
dod_filt = hmrBandpassFilt(dod, fs, hpf, lpf);

%% 
% Convert changes in OD to changes in concentrations (HbO, HbR, and HbT)
ppf = [6 6]; % partial pathlength factors for each wavelength.
dc = hmrOD2Conc( dod_filt, SD, ppf );
%dcWithoutBandPass = hmrOD2Conc( dod, SD, ppf );
%%
% trigger4 = find(s(:,4)==1 , 8);
% endOfAuto = trigger4(8)+400;
%dod_filt_auto = dod_filt(trigger4(1):endOfAuto, :);
%s_auto = s(trigger4(1):endOfAuto, :);


%%

%hold on
%plot(s_auto)
%plot(dod_filt_auto(:,1))

%%
trigger4 = find(s(:,4)==1 , 8);
endOfAuto = trigger4(8)+400;
dc_auto = dc(trigger4(1)-200:endOfAuto, :,:);
s_auto = s(trigger4(1)-200:endOfAuto, :);

hbo=squeeze(dc_auto(:,1,:));
hbr=squeeze(dc_auto(:,2,:));
hbt=squeeze(dc_auto(:,3,:));

%%
displayAll = false;
s_for_plot = s_auto*0.00003;
if (displayAll) 
    for i=1:size(hbo,2)
        subplot(5,4,i)
        hold on
        plot(hbo(:,i))
        plot(s_for_plot)
    end
else
        hold on
        plot(hbo(:,13))
        plot(s_for_plot)
end
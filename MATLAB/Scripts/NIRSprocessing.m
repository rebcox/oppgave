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
% checking for bad channels and removing them (SD.MeasListAct has 0s in put for bad channels)
tIncMan = ones(size(aux,1),1);
dRange = [0  10000000];
snrThreshold = 2;
resetFlag = 0;
SD = enPruneChannels(d, SD, tIncMan, dRange, snrThreshold, resetFlag);
%%
% bad channels
%fprintf(2, 'Bad channels are:\n'); round(find(SD.MeasListAct == 0)/2)

% correcting for motion artifacts using Wavelet-based motion correction.
%Note: Channels that are not in the active MeasList remain unchanged
iQr = 1.5;
%[dod_corr] = hmrMotionCorrectWavelet(dod, SD, iQr);

% Trying the PCA motion correction as well. Only use one. Either wavelet correection or this one
%nSV = 0.80;
%[dod_corr,svs,nSV] = hmrMotionCorrectPCA( SD, d, tIncMan, nSV);

%Use no motion artifact correction method
%iQr = -1;
%[dod_corr] = hmrMotionCorrectWavelet(dod, SD, iQr);
dod_corr=dod;
%%
% Identifies motion artifacts in an input data matrix d. If any active
% data channel exhibits a signal change greater than std_thresh or
% amp_thresh, then a segment of data around that time point is marked as a
% motion artifact.
fs = 1/(t(2)-t(1));  % sampling frequency of the data
tMotion = 0.5;
tMask = 1;
stdevThreshold = 20;
ampThreshold = 0.3;

%tIncAuto = hmrMotionArtifact(dod_corr, fs, SD, tIncMan, tMotion, tMask, stdevThreshold, ampThreshold);

%%
%Once the Motion Artifacts are identified, we eliminate them using
%enStimRejection. It sets the s values to -1 so that the particuar stim is
%rejected.
tRange = [-2 10];
%[s tRange] = enStimRejection(t, s, tIncAuto, tIncMan, tRange);
%%

% Band-pass filtering
lpf = 0.5; % in Hz
hpf = 0.01; % in Hz
dod_corr_filt = hmrBandpassFilt(dod_corr, fs, hpf, lpf);
%%

% Convert changes in OD to changes in concentrations (HbO, HbR, and HbT)
ppf = [6 6]; % partial pathlength factors for each wavelength.
dc = hmrOD2Conc(dod_corr_filt, SD, ppf);
%% 
% Basically At this point, dc contains the calculated change in
% concentration for all timepoint, for each time of Hb entity(HbO, HbT and
% HbR) across all 20 optodes of measurement ( Timestamp*3*20). Since the 3
% is constant, we divide the dc array in to 3 separate
% (Timestamp*Noptodes), giving us the time series of HbO, HbT and HbR for
% all optodes
hbo=squeeze(dc(:,1,:));
hbr=squeeze(dc(:,2,:));
hbt=squeeze(dc(:,3,:));

trigger1 = find(s(:,1)==1 , 8); % Not really using trigger1 but just doing it for uniformity
trigger2 = find(s(:,2)==1 , 8);
trigger3 = find(s(:,3)==1 , 8);
trigger4 = find(s(:,4)==1 , 8);

%% 

% Calculate the block average given the stimulation conditions in s over
% the time range trange. The baseline of the average is set to zero by
% subtracting the mean of the average for t<0.
tRange = [-2 10]; %defines the range for the block average [tPre tPost]
[dcAvg, dcAvgStd, tHRF, nTrials, dcSum2] = hmrBlockAvg(dc, s, t, tRange);
% The s vector that is being passed into the hmrBlockAvg() was changed from
% s0 to s by srinath sibi
%%

%%Inserting the bit that divides the dcAvg and dcAvgStd into HbO HbR HbT
%%components for autonomous, partial and manual.%% Note that while it is nice to split the data into different arrays, storage becomes a pain.
% Better to save dcAvg and dcAvgStd to .mat files that will let us extract and
% analyze them later. The initial division and plot is for comparison and
% awareness
[ dimA dimB dimC dimD ] = size(dcAvg);
%First Dividing the dcAvg array

PartialLaneChangeHbOHRF = dcAvg(:,1,:,2);
PartialLaneChangeHbOHRF = squeeze(PartialLaneChangeHbOHRF);
PartialLaneChangeHbRHRF = dcAvg(:,2,:,2);
PartialLaneChangeHbRHRF = squeeze(PartialLaneChangeHbRHRF);
PartialLaneChangeHbTHRF = dcAvg(:,3,:,2);
PartialLaneChangeHbTHRF = squeeze(PartialLaneChangeHbTHRF);

ManualLaneChangeHbOHRF = dcAvg(:,1,:,3);
ManualLaneChangeHbOHRF = squeeze(ManualLaneChangeHbOHRF);
ManualLaneChangeHbRHRF = dcAvg(:,2,:,3);
ManualLaneChangeHbRHRF = squeeze(ManualLaneChangeHbRHRF);
ManualLaneChangeHbTHRF = dcAvg(:,3,:,3);
ManualLaneChangeHbTHRF = squeeze(ManualLaneChangeHbTHRF);

AutonomousLaneChangeHbOHRF = dcAvg(:,1,:,4);
AutonomousLaneChangeHbOHRF = squeeze(AutonomousLaneChangeHbOHRF);
AutonomousLaneChangeHbRHRF = dcAvg(:,2,:,4);
AutonomousLaneChangeHbRHRF = squeeze(AutonomousLaneChangeHbRHRF);
AutonomousLaneChangeHbTHRF = dcAvg(:,3,:,4);
AutonomousLaneChangeHbTHRF = squeeze(AutonomousLaneChangeHbTHRF);

   
% I am saving dcAvg, dcAvgStd, tHRF, nTrials, dcSum2 using the save() and I will be using participant specific names before I save
% them. This is so that when I load the data into MATLAB again, I can use load and then load them into particpipant specific variables for group average
figure
for i = 1:20
    subplot(5,4,i)
    plot(tHRF,ManualLaneChangeHbOHRF(:,i),tHRF,PartialLaneChangeHbOHRF(:,i),tHRF,AutonomousLaneChangeHbOHRF(:,i))
    xlabel('Time (Seconds)');
    ylabel(' HbO ');
    %vline( 0, 'g', 'Onset of Stimulus' );
   % legend('Manual','Partial','Autonomous')
end

Participant012dcAvg = dcAvg;
Participant012dcAvgStd = dcAvgStd;
Participant012tHRF = tHRF;
Participant012nTrials = nTrials;
Participant012dcSum2 = dcSum2;

save('Participant012dcAvg.mat','Participant012dcAvg');
save('Participant012dcAvgStd.mat','Participant012dcAvgStd');
save('Participant012tHRF.mat','Participant012tHRF');
save('Participant012nTrials.mat','Participant012nTrials');
save('Participant012dcSum2.mat','Participant012dcSum2');
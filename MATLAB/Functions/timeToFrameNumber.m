function frameNumber = timeToFrameNumber(minutes,seconds,fs, participantNo)

secondsTotal = minutes*60+seconds;

%secondsTotal = -14.8 + frameNumber/fs; %part8
%fs*secondsTotal = -14.8*fs + frameNumber
%frameNumber = (secondsTotal+14.8)*fs


if(participantNo == 8)
    frameNumber = round((14.8 + secondsTotal)*fs); %part8
elseif(participantNo == 9)
    frameNumber = round((31.3 + secondsTotal)*fs); %part9
elseif(participantNo == 11)
    frameNumber = round((26.2 + secondsTotal)*fs); %part11
elseif(participantNo == 12)
    frameNumber = round((34.54 + secondsTotal)*fs); %part12
elseif(participantNo == 17)
    frameNumber = round((389.1 + secondsTotal)*fs); %part12
elseif(participantNo == 25)
    frameNumber = round((-126.72 + secondsTotal)*fs); %part25
else
    disp('Participant number not synchronized yet');
    frameNumber = 0;
end
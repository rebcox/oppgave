function time = frameNumberToTime(frameNumber,fs, participantNo)

if(participantNo == 8)
    secondsTotal = round(-14.8 + frameNumber/fs); %part8
elseif(participantNo == 11)
    secondsTotal = round(-26.2 + frameNumber/fs); %part11
elseif(participantNo == 12)
    secondsTotal = round(-34.5 + frameNumber/fs); %part12
elseif(participantNo == 17)
    secondsTotal = round(-389.1 + frameNumber/fs); %part17
elseif(participantNo == 19)
    secondsTotal = round(-225.7 + frameNumber/fs); %part24
elseif(participantNo == 24)
    secondsTotal = round(-13.5 + frameNumber/fs); %part24
elseif(participantNo == 25)
    secondsTotal = round(126.7 + frameNumber/fs); %part25
else
    disp('Participant number not synchronized yet');
    secondsTotal = 0;
end

minutes = floor(secondsTotal/60);
seconds = mod(secondsTotal, 60);

min_str = num2str(minutes);
sec_str = num2str(seconds);
if seconds < 10
    time = strcat(min_str,':','0',sec_str);
else
    time = strcat(min_str,':',sec_str);
end

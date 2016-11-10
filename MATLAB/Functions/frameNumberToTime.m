function time = frameNumberToTime(frameNumber,fs)

secondsTotal = round(-34.54 + frameNumber/fs); %part12
secondsTotal = round(126.72 + frameNumber/fs); %part25

minutes = floor(secondsTotal/60);
seconds = mod(secondsTotal, 60);

min_str = num2str(minutes);
sec_str = num2str(seconds);
if seconds < 10
    time = strcat(min_str,':','0',sec_str);
else
    time = strcat(min_str,':',sec_str);
end

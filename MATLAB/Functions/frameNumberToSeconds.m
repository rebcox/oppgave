function time = frameNumberToSeconds(frameNumber,fs)

secondsTotal = round(-34.54 + frameNumber/fs);


minutes = floor(secondsTotal/60);
seconds = mod(secondsTotal, 60);

min_str = num2str(minutes);
sec_str = num2str(seconds);

time = strcat(min_str,':',sec_str);
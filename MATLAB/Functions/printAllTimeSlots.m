function printAllTimeSlots(spikes, fs)
noSpikes=size(spikes,1);
printOut = 'Time slots: \n';
%timeSlots = zeros(noSpikes,2);
for i=1:noSpikes
    starts = frameNumberToTime(spikes(i,1), fs, 25);
    ends = frameNumberToTime(spikes(i,2), fs, 25);
    
    printOut = strcat(printOut, num2str(starts), '-', num2str(ends), '\n');
end
fprintf(printOut);
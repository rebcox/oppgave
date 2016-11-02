function printAllTimeSlots(spikes, fs)
noSpikes=size(spikes,1);

%timeSlots = zeros(noSpikes,2);
for i=1:noSpikes
    starts = frameNumberToSeconds(spikes(i,1), fs);
    ends = frameNumberToSeconds(spikes(i,2), fs);
    
    strcat('Spike ', {' '}, num2str(i), {': '}, num2str(starts), '-', num2str(ends))
end

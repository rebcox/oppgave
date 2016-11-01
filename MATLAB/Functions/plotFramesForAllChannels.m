function plotFramesForAllChannels(frames, data, s, motions, magnitude)
%Process and plot delta OD for all optodes/channels for
% frames ( [startFrame endFrame] )
% magnitude for dod: ~0.15. magnitude for hbo: ~0.00003

startFrame = frames(1);
endFrame = frames(2);

data_selected = data(startFrame:endFrame, :);
save dod_selected
s_selected = s(startFrame:endFrame, :); 

plotDataWithMotion(data_selected,1, motions, s_selected, magnitude, true, 'Without bandpass filter');

end
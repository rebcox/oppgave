function bothChannels = plotSeveralChannels(dataToPlot, channels, magnitude, s)

hold on

for i=1:size(channels,2)
    plot(dataToPlot(:,channels(i)));
end
s_for_plot = s*magnitude;
plot(s_for_plot, 'm') 
plot(-s_for_plot, 'm') 

autoStimStart = find(s(:,4));
axis([autoStimStart(1)-100 autoStimStart(8)+400 -0.2 0.2]);

%figure
%bothChannels = [dataToPlot(:,channels(1)), dataToPlot(:,channels(2))]';
%shadedErrorBar([1:18550],mean(bothChannels,1),std(bothChannels),'g');

      
end

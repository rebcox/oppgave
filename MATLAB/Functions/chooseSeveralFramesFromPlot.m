function framesChosen = chooseSeveralFramesFromPlot(dataToPlot, channel, magnitude, s)

framesChosen =  [];

hold on
s_for_plot = s*magnitude;
plot(dataToPlot(:,channel));
plot(s_for_plot, 'm') 
plot(-s_for_plot, 'm') 

autoStimStart = find(s(:,4));
axis([autoStimStart(1)-100 autoStimStart(8)+400 -0.2 0.2]);
        
%plotDataWithMotion(dataToPlot, channel, motions, s, magnitude, false, 'Choose frames');

% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'Choose frames',...
    'UserData', [0 0 0 0], 'Position', [20 20 100 20], 'Callback', @getInput);
hold on
i = 1;
while ishandle(1)
    waitfor(btn, 'UserData');
    if (ishandle(1))
        points = btn.UserData;
        framesChosen(i,:) = [points(1) points(3)];
        plot(points(1), points(2),'r*');
        plot(points(3), points(4),'g*');
    end
    i=i+1;
end

name = strcat('framesDodPart25Channel',num2str(channel))
save(name, 'framesChosen')

end

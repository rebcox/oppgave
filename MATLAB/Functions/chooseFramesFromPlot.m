function framesToDisplay = chooseFramesFromPlot(dataToPlot, channel, magnitude, motions, s)
framesToDisplay =  [];

plotDataWithMotion(dataToPlot, channel, motions, s, magnitude, false, 'Choose frames');

% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'Choose frames',...
    'UserData', [0 0 0 0], 'Position', [20 20 100 20], 'Callback', @getInput);

waitfor(btn, 'UserData');
if (ishandle(1)) %if figure is open
    points = btn.UserData;
    framesToDisplay = [points(1) points(3)]; 
    close(gcf);
end


end

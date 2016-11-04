function framesChosen = chooseSeveralFramesFromPlot(dataToPlot, channel, magnitude, motions, s)

plotDataWithMotion(dataToPlot, channel, motions, s, magnitude, false, 'Choose frames');

% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'Choose frames',...
    'UserData', [0 0], 'Position', [20 20 100 20], 'Callback', @getInput);
hold on
i = 1;
while ishandle(1)
    waitfor(btn, 'UserData');
    if (ishandle(1))
        framesChosen(i,:) = btn.UserData;
        plot(framesChosen(i,1),0,'r*');
        plot(framesChosen(i,2),0,'c*');
    end
    i=i+1;
end

end

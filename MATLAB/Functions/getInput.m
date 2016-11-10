function getInput(source, event)
    [framesToDisplayDecimal,y] = ginput(2);
    framesToDisplay(1) = round(framesToDisplayDecimal(1));
    framesToDisplay(2) = round(framesToDisplayDecimal(2));
    source.UserData = [framesToDisplay(1) y(1) framesToDisplay(2) y(2) ];
end
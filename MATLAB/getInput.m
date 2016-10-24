function getInput(source, event)
    [framesToDisplayDecimal,~] = ginput(2);
    framesToDisplay(1) = round(framesToDisplayDecimal(1));
    framesToDisplay(2) = round(framesToDisplayDecimal(2));
    framesToDisplay
    save framesToDisplay
end
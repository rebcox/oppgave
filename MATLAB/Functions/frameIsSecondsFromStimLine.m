function OK = frameIsSecondsFromStimLine(noSeconds, frame, fs, s)
% Returns true if the frame number is more than noSeconds from a stimulus line

% Input:
% noSeconds: The number seconds from a stimulus line the frame can't be in
% frame: The frame number to be tested
% fs: Sampling frequency
% s: stimulus lines

OK = true;
%all autonomous stimulus lines
trigger4 = find(s(:,4)==1 , 8);
noFramesToSkip = floor(fs*noSeconds);

for i=1:size(trigger4)
    if trigger4(i) > frame
       break 
    end
    if (trigger4(i) + noFramesToSkip) > frame
        OK = false;
        break
    end
end

end
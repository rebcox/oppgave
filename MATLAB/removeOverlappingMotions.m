function motionsNoOverlap = removeOverlappingMotions(noSeconds, motions, fs)
% Input:
% noSeconds: Minimum number of seconds between to start timestamps of
% motions
% motions: The list of motions (startFrame, endFrame, typeOfMotion)
% fs: Sampling frequency

noFramesToSkip = floor(fs*noSeconds);
%motionsToRemove = zeros(noMotions,1);
i=1;
while i < size(motions,1)
    if (motions(i,1) + noFramesToSkip) > motions(i+1,1)
        %motionsToRemove(i+1)=true;
        noMotions = size(motions,1);
        
        if (i+2 < noMotions) %remove motion(i+1,:)
            motions = motions([1:i,i+2:noMotions],:); 
        else
            motions = motions(1:i,:);
        end
        i=i-1; %stay at same i. motions(i,1) must be checked for motions(i+2,1)
    end
    i=i+1;
end
motionsNoOverlap = motions;
end
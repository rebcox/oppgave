function saveAllActions( noFrames, motions )
%Save actions on every frame to a .mat file

actionAllFrames = zeros(noFrames, 1);
noMotions = size(motions,1);
for i=1:noMotions
    startFrame = motions(i,1);
    endFrame = motions(i,2);
    motion = motions(i,3);
    actionAllFrames(startFrame:endFrame,1)=motion;
end

save actionAllFrames;

end


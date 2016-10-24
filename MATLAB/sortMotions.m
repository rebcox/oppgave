function lookRightTimeStamps = sortMotions()
readMotionFile;
noMotions = size(motions,1);
lookRightTimeStamps = zeros(noMotions, 1);

%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
k = 1;
for i=1:noMotions
    if motions(i,3) == 2
        lookRightTimeStamps(k)=motions(i,1);
        k=k+1;
    end
end
lookRightTimeStamps = lookRightTimeStamps(1:k-1);
%save lookRightTimeStamps

end
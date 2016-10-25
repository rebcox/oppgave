function [leftTs, rightTs, downTs, upTs, yawnTs] = sortMotions(motions)
% Returns the timestamps of motions sorted by movements

noMotions = size(motions,1);

leftTs = zeros(noMotions, 1);
rightTs = zeros(noMotions, 1);
downTs = zeros(noMotions, 1);
upTs = zeros(noMotions, 1);
yawnTs = zeros(noMotions, 1);

%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
l=1; r=1; d=1; u=1; y=1;
for i=1:noMotions
    if motions(i,3) == 1
        leftTs(l) = motions(i,1);
        l=l+1;
    elseif motions(i,3) == 2
        rightTs(r) = motions(i,1);
        r=r+1;
    elseif motions(i,3) == 3
        downTs(d) = motions(i,1);
        d=d+1;
    elseif motions(i,3) == 4
        upTs(u)=motions(i,1);
        u=u+1;    
    elseif motions(i,3) == 5
        yawnTs(y)=motions(i,1);
        y=y+1;
    end
end

%Shrink the lists of timestamps to their actual size
if (l==1)
    leftTs = zeros(0);
else
    leftTs = leftTs(1:l-1);
end
if (r==1)
    rightTs = zeros(0);
else
    rightTs = rightTs(1:r-1);
end
if (d==1)
    downTs = zeros(0);
else
    downTs = downTs(1:d-1);
end
if (u==1)
    upTs = zeros(0);
else
    upTs = upTs(1:u-1);
end
if (y==1)
    yawnTs = zeros(0);
else
    yawnTs = yawnTs(1:y-1);
end

end
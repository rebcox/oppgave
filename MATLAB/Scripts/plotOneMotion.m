
hboRightAroundZero = hboRight;
for i=1:size(hboRight,1)
    meanOfLine = mean(hboRight(i,:));
    hboRightAroundZero(i,:) = hboRight(i,:)-meanOfLine;
end
% 
% hold on
% for i=1:size(hboRight,1)
%     plot(0:1/fs:(10-1/fs), hboRightAroundZero(i,:));
%     
% end

figure
hold on
for i=1:size(hboRight,1)
    plot(hboRight(i,:));
end

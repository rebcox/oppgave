%Open text file created in java program
fileName = 'motionData.txt';
fileID = fopen(fileName,'r');

%Read the file into a cell array
motionsRaw = textscan(fileID, '%s %s %s');
cellsz = cellfun(@size,motionsRaw,'uni',false);
sizeOfFirstCell = cellsz{:};
noMotions = sizeOfFirstCell(1);

%Convert the cell array into a normal array with the following coding:
%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
%motions is a 2D array: [frame, movementCode]
motions = zeros(noMotions,3);
for i=1:noMotions
    motions(i,1) = str2num(motionsRaw{1}{i});
    motions(i,2) = str2num(motionsRaw{2}{i});
    if (strcmp(motionsRaw{3}{i}, 'LOOKLEFT'))
        motions(i,3) = 1;
    elseif (strcmp(motionsRaw{3}{i}, 'LOOKRIGHT'))
        motions(i,3) = 2;
    elseif (strcmp(motionsRaw{3}{i}, 'LOOKDOWN'))
        motions(i,3) = 3;
    elseif (strcmp(motionsRaw{3}{i}, 'LOOKUP'))
        motions(i,3) = 4;
    elseif (strcmp(motionsRaw{3}{i}, 'YAWN'))
        motions(i,3) = 5;
    end
end


  
  
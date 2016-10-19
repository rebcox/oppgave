%Open text file created in java program
fileName = 'motionData.txt';
fileID = fopen(fileName,'r');

%Read the file into a cell array
motionsRaw = textscan(fileID, '%s %s');
cellsz = cellfun(@size,motionsRaw,'uni',false);
sizeOfFirstCell = cellsz{:};
numberOfMotions = sizeOfFirstCell(1);

%Convert the cell array into a normal array with the following coding:
%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
%motions is a 2D array: [frame, movementCode]
motions = zeros(numberOfMotions,2);
for i=1:numberOfMotions
    motions(i,1) = str2num(motionsRaw{1}{i});
    if (strcmp(motionsRaw{2}{i}, 'LOOKLEFT'))
        motions(i,2) = 1;
    elseif (strcmp(motionsRaw{2}{i}, 'LOOKRIGHT'))
        motions(i,2) = 2;
    elseif (strcmp(motionsRaw{2}{i}, 'LOOKDOWN'))
        motions(i,2) = 3;
    elseif (strcmp(motionsRaw{2}{i}, 'LOOKUP'))
        motions(i,2) = 4;
    elseif (strcmp(motionsRaw{2}{i}, 'YAWN'))
        motions(i,2) = 5;
    end
end


  
  
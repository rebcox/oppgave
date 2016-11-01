magnitude=0.15;    
generalName = 'Channel no: ';
for i=1:20
    i_str = num2str(i);
    nameForplot = strcat(generalName, i_str);
    plotDataWithMotion( dod , i, motions, s, magnitude, false, nameForplot)
end

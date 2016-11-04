function plotDataWithMotion( data , channel, motions, s, magnitude, displayAllChannels, titleOfPlot)
%plotWithMotion plot data with colored areas where there are motions
%if displayAllChannels is true, channel can be a random number
% magnitude for dod: ~0.15. magnitude for hbo: ~0.00003


figure('Name', titleOfPlot, 'NumberTitle','off')
%1:LOOKLEFT, 2:LOOKRIGHT, 3:LOOKDOWN, 4:LOOKUP, 5:YAWN
hold on

% for i=1:size(motions,1)
%     if (motions(i,3) == 1)
%         area([motions(i,1) motions(i,2)], [magnitude, magnitude], 'FaceColor', 'y', 'LineStyle', 'none');
%         area([motions(i,1) motions(i,2)], [-magnitude, -magnitude], 'FaceColor', 'y', 'LineStyle', 'none');
%     elseif (motions(i,3) == 2)
%         area([motions(i,1) motions(i,2)], [magnitude, magnitude], 'FaceColor', 'r', 'LineStyle', 'none');
%         area([motions(i,1) motions(i,2)], [-magnitude, -magnitude], 'FaceColor', 'r', 'LineStyle', 'none');
%     elseif (motions(i,3) == 3)
%         area([motions(i,1) motions(i,2)], [magnitude, magnitude], 'FaceColor', 'c', 'LineStyle', 'none');
%         area([motions(i,1) motions(i,2)], [-magnitude, -magnitude], 'FaceColor', 'c', 'LineStyle', 'none');
%     elseif (motions(i,3) == 4)
%         area([motions(i,1) motions(i,2)], [magnitude, magnitude], 'FaceColor', 'g', 'LineStyle', 'none');
%         area([motions(i,1) motions(i,2)], [-magnitude, -magnitude], 'FaceColor', 'g', 'LineStyle', 'none');
%     elseif (motions(i,3) == 5)
%         area([motions(i,1) motions(i,2)], [magnitude, magnitude], 'FaceColor', 'm', 'LineStyle', 'none');
%         area([motions(i,1) motions(i,2)], [-magnitude, -magnitude], 'FaceColor', 'm', 'LineStyle', 'none');
%     end
% end

%make this general
noSubPlots = size(data,2);
noFigures = 1;
if (noSubPlots == 40)
    noFigures = 2;
    noSubPlots=20;
end

s_for_plot = s*magnitude;
if (displayAllChannels) 
    for i=1:noSubPlots
        subplot(5,4,i)
        hold on
        
        dataPlot = plot(data(:,i));
        plot(s_for_plot)
    end
    if noFigures == 2
        hold off
        figure
        temp = 1;
        for i=21:40
            subplot(5,4,temp)
            temp=temp+1;
            hold on

            dataPlot = plot(data(:,i));
           % dataPlot.LineWidth = 2;
            plot(s_for_plot)
        end
    end
else
       % hold on
        dataPlot = plot(data(:,channel));
        %dataPlot.LineWidth = 1;
        %Triggers
        plot(s_for_plot) 
end
hold off


end


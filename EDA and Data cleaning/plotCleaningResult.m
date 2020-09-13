function [] = plotCleaningResult(data,idxNaN, year)
%PLOTCLEANINGRESULT given the data clean and indexes of the rows where
%there were missing values, we plot observations of each variable with
%different colors and assign to it a 0 if it is a correct value or 1 if is
%a rejected (missing) value
%INPUTS
    %data: table with data
    %idxNan: table of indices with 0 (useful value) and 1(missing value)
    %year: year from which is the data
%Author: Montserrat Sacie Alcázar
%--------------------------------------------------------------------------
clf;
hold on;
plot(data.DATE, idxNaN(:,1), 'Marker', '.', 'MarkerEdgeColor', 'blue', 'LineStyle','none', 'MarkerSize',11)
plot(data.DATE, idxNaN(:,2) +0.01, 'Marker', '.', 'MarkerEdgeColor', 'red', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,3) + 0.02, 'Marker', '.', 'MarkerEdgeColor', 'green', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,4) + 0.03, 'Marker', '.', 'MarkerEdgeColor', 'cyan', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,5) + 0.04, 'Marker', '.', 'MarkerEdgeColor', 'magenta', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,6) + 0.05, 'Marker', '.', 'MarkerEdgeColor', 'yellow', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,7) + 0.06, 'Marker', '.', 'MarkerEdgeColor', 'red', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,8) + 0.07, 'Marker', '.', 'MarkerEdgeColor', 'black', 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,9) + 0.08, 'Marker', '.', 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'LineStyle','none','MarkerSize',11)
plot(data.DATE, idxNaN(:,10) + 0.09, 'Marker', '.', 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'LineStyle','none','MarkerSize',11)

xlabel('Data registers')
ylabel('Useful or Rejected value')
title({'Cleaning Process Result', ['Data from ' year]})
yticks([0.05 1])
yticklabels({'Useful', 'Rejected'})
xtickangle(45)
xlim([datetime(data.YY(1), data.MM(1), data.DD(1), data.hh(1), data.mm(1),0) ,datetime(data.YY(end), data.MM(end), data.DD(end), data.hh(end), data.mm(end),0)])
ylim([0, 1.2])
legend('Wind direction', 'Wind speed', 'Peak of gust speed',...
    'Significant wave height', 'Dominant wave period', ...
    'Average wave period', 'Waves direction', 'Sea level pressure',...
    'Air temperature', 'Sea surface temperature','Location', 'east')
legend('boxoff')
end


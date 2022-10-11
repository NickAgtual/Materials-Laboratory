close all; clear;
%% Data 

% Impact Energy in lb-ft
impactEnergy = [49.5 114 20.5 12.5 127 5.5 39.75 8.5];
% Sample Materials
materials = categorical({'Low Carbon Steel (1018)', '304 Stainless Steel', ...
    '6061 Aluminum Alloy', '360 Free Machining Brass Alloy', ...
    '110 Copper Alloy', 'PVC (Notched)', 'PVC (Un-Notched)', ...
    'Hardwood Maple'});

% Maintains order of sample materials for bar graph
materialsOrdered = reordercats(materials, {'Low Carbon Steel (1018)',...
    '304 Stainless Steel', '6061 Aluminum Alloy', '360 Free Machining Brass Alloy', ...
    '110 Copper Alloy', 'PVC (Notched)', 'PVC (Un-Notched)', ...
    'Hardwood Maple'});

%% Plot 

% Creates figure
figure(1)

% Creates bar graph
barGraph = bar(materialsOrdered, impactEnergy);

hold on;
% Creates grid
grid on;
% Defines grid size
grid minor;

% ----- Displaying Values -----

% Finds the x-coordinates of each bar
xTips = barGraph.XEndPoints;
% Finds the y-coordinates of each bar
yTips = barGraph.YEndPoints + 2.75;
% Asgines the label of each bar as the impact energy
labels = string(barGraph.YData);
% Displaying values at tips of bars
text(xTips, yTips, labels, 'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'bottom', 'FontName', 'Times');

% ----- Error Bars -----

% Defines error as 3
deltaImpactEnergy = 3;
% Creates positive error of 3
errorHigh = ones(1, length(impactEnergy)) * deltaImpactEnergy;
% Creates negarive error of -3
errorLow = ones(1, length(impactEnergy)) * -deltaImpactEnergy;
% Creates errror bars
error = errorbar(materialsOrdered, impactEnergy, errorLow, errorHigh);
% Makes error bars black
error.Color = [0 0 0];
% Disconnectes error bars for each material
error.LineStyle = 'none';

% ---- Plot Descriptors -----

% Creates Y-Axis Label
ylabel(' {Impact Energy (lb-ft)}', 'fontsize', 11, 'FontName', 'Times', 'Interpreter', 'latex');
% Creates X-Axis Label
set(gca, 'XTickLabel', materialsOrdered, 'XTick', barGraph.XData, 'FontSize', 11, ...
    'TickLabelInterpreter', 'latex');
% Creates Plot Title
title('{Impact Energy (lb-ft) of Various Material Types}', 'fontsize', 14, ...
    'FontName', 'Times', 'Interpreter', 'latex');
% Generates and positions legend
legend('Experimental Data', 'Error Bars', 'location','northeast');

%% Calculations

% Converting impact energy from lb-ft to Joules
% 1 ft-lb = 1.35582 J
impactEnergyJ = impactEnergy * 1.35582;
% Calculating the new error for conversion
deltaImpactEnergyJ = abs(1.35582) * deltaImpactEnergy;





close all; clear

%% Data

% Tepmerature (deg C)
temperature = ([-108.4 32 212] - 32 ) * 5/9;

% Impact Energy for 304 Stainless Steel (ft-lb)
impactEnergy304 = [129 119 115.5];

% Imact Energy for 1018 Steel (ft.lb)
impactEnergy1018 = [15.5 67.5 49.5];

%% Plots

% Creating New Figure
figure(1)

% Keeps figure one
hold on
% Turns grid on
grid on
% Makes grid size sma;;
grid minor

% Plotting temperature veruses impact energy for 304 stainless steel
plot(temperature, impactEnergy304, 'Color', '#0072BD', 'LineWidth', 2);

% Plotting temperature versus impact energy for 1018 steel
plot(temperature, impactEnergy1018, 'Color','#77AC30', 'LineWidth', 2);

% Setting Axis Limits
xlim([-88 110]);
ylim([0 145]);

% ----- Error Bars -----

% Defines error as 3
deltaImpactEnergy = 3;
% Creating error vector
error = deltaImpactEnergy * ones(size(impactEnergy304));
% Plotting error Bars
errorBar304 = errorbar(temperature, impactEnergy304, error); 
errorBar1018 = errorbar(temperature, impactEnergy1018, error);
% Modifying error bar properties
errorBar304.Color = 'k';
errorBar304.CapSize = 5;
errorBar304.LineStyle = 'None';
errorBar1018.Color = 'k';
errorBar1018.CapSize = 5;
errorBar1018.LineStyle = 'None';

% ----- Plot Descriptors -----

% Creates Y-Axis Label
ylabel(' {Impact Energy (lb-ft)}', 'fontsize', 11, 'FontName', 'Times', ...
    'Interpreter', 'latex');
% Creates X-Axis Label
xlabel(' {Temperature ($${^\circ}$$C)}', 'fontsize', 11, 'FontName', 'Times', ...
    'Interpreter', 'latex');
% Creates Plot Title
title('{Impact Energy (lb-ft) vs Temperature ($${^\circ}$$C)}', 'fontsize', 14, ...
    'FontName', 'Times', 'Interpreter', 'latex');
% Generates and positions legend
legend('304 Stainless Steel', '1018 Steel', 'Error Bars ($${\pm}$$ 3)', 'location', ...
    'northeast', 'FontName', 'Times', 'Interpreter', 'latex');
% Adjusting Axis Properties
ax = gca;
ax.FontName = 'Times';


%% Calculations

% Converting impact energy from lb-ft to Joules
% 1 ft-lb = 1.35582 J
impactEnergy304J = impactEnergy304 * 1.35582;
impactEnergy1018J = impactEnergy1018 * 1.35582;
% Calculating the new error for conversion
deltaImpactEnergyJ = abs(1.35582) * deltaImpactEnergy;

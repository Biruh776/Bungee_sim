clear, clc, clf
%this draws the stress vs strain graph for the region of...
...proportionality(before the yield limit), and computes the ...
... proportionality constant
stressStrain = xlsread('stressStrain', 'A2:B9');
stress = stressStrain(:,1);
strain = stressStrain(:,2);
scatter(strain, stress,'filled')
hold on
plot(strain, stress,'r', 'LineWidth', 0.6)
title('Stress vs Strain Graph for the Bungee Cord')
xlabel({'Strain','(mm/mm)'})
ylabel({'Stress','Mpa'})
hold on
p = polyfit(strain, stress,1)
d = polyval(p, strain);
plot(strain, d,'k','LineWidth', 0.6), grid
hold on
legend('scatter plot', 'graph', 'polyfit line')

clear, clc, clf
%This draws the strain vs stress graph
stressStrain = xlsread('stressStrain', 'A2:B11');
stress = stressStrain(:,1);
strain = stressStrain(:,2);
scatter(strain, stress,'filled')
hold on
plot(strain, stress,'r', 'LineWidth', 0.6), grid
title('Stress vs Strain Graph for the Bungee Cord')
xlabel({'Strain','(mm/mm)'})
ylabel({'Stress','Mpa'})

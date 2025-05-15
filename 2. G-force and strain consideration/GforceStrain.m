clear,clc, clf
gforceStrain = xlsread('gforce'); %read data from the excel file 'gforce.xls'
gforce = gforceStrain(:,2);
strain = gforceStrain(:,1);
scatter(strain, gforce,'filled')
hold on
title('G-force on the Jumper vs Strain of the cord')
xlabel({'Strain','(mm/mm)'})
ylabel({'G-force'})
plot(strain, gforce,'r', 'LineWidth', 0.6), grid
hold on
strain=0:6;
gforce=3;
plot(strain,gforce*ones(size(strain)), 'b', 'LineWidth', 0.6) %boundery condition at g-force = 3;
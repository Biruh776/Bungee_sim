clear,clf,clc
for i=1:250
    t(i)=i/10;
    [vinst(i), xinst(i)] = InstValue(0.001, 0, t(i), 0);
end
[x] = FindEquation(t,xinst,20,'r','k');
[v] = FindEquation(t,vinst,20,'b','y');
legend('Actual Displacement','Discretized Displacement line','Actual Velocity','Discretized Velocity line');
vmax=findMaxOrMin(v,1);
xmax=findMaxOrMin(x,1)-9.32;
disp(['The maximum speed is ', num2str(vmax)]);
disp(['The maximum extension is ', num2str(xmax)]);
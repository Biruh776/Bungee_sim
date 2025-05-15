clc, clear
m = 68.1;   % mass(Kg)
g = 9.81;   %gravity at surface
t = 4;      %time(s)
cd = 0.25;  %drag coeffiecent of a human in air
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t) %Velocity (m/s)


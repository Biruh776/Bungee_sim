clear, clc
m0 = 68.1; %mas of the jumper(Kg)
g = 9.81; %gravity(m/s^2)
E = 667500; %Elastic modulus(Pa)
r = 0.15; %range of allowable mass = 15%
d = 930; %density of natural rubber(Kg/m^3)
h = 30; %total height of jump(m)
e0 = 2; %least allowable strain from the g-force condition
%Cross-sectional area of the cord
A = 2*m0*g*(1+e0)/(E*e0^2)
%Maximum allowable mass on this cord
m = m0 + r*m0;
%Calculating the strain parameter(z)
z = m*g/(A*E)
%Update strain value for this codition
e = z + sqrt(z*(z+2))
%Length of the cord
L = h/(1+e)
%Mass of the cord
m = d*A*L
%Stiffness of the cord
k = A*E/L

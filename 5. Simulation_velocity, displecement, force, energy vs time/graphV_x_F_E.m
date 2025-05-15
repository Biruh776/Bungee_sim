clear,clf
    %c is drag coefficent of a person falling
    %m is mass of the person
    %g is value of Earth's gravity
    %L is the length of the rope
    %x is displacement from the jumping point
    %k is the stiffness constant of the rope, we got it from
    %p is the density of the air
    %A is the cross sectional area of the person
    %h is the height which the person jumped from
    
c=0.25;   
m=68.1;  
g = 9.81; 
L=9.32;
k = 107.66;
p=1.3;
A=0.8;
h=30;

for i=1:1000
    t(i)=i/40;
    [vinst(i), xinst(i)] = InstValue(0.001, 0, t(i), 0);

    % FINDING  FORCE 
    dragForce(i)=-sign(vinst(i))*1/2*c*p*A*(vinst(i)^2);
    weight(i)=m*g;
    if xinst(i)>L
        tension(i)=-k*(xinst(i)-L);
    else
        tension(i)=0;
    end
    ForceNet(i)=weight(i)+dragForce(i)+tension(i);

    %FINDING ENERGY
    kineticEnergy(i)=1/2*m*(vinst(i)^2);
    GravPotentialEnergy(i)=m*g*(h-xinst(i));
    if xinst(i)>L
        ElasticPotenialEnergy(i)=1/2*k*(xinst(i)-9.32)^2;
    else
        ElasticPotenialEnergy(i)=0;
    end
    TotalEnergy(i)=kineticEnergy(i)+GravPotentialEnergy(i)+ElasticPotenialEnergy(i);

end

figure(1)
    plot(t,xinst,'b','LineWidth',2);
    hold on
    plot(t,vinst,'r','LineWidth',2);
    grid
    legend('Instantanious Displacement','Instantanious Velocity');
    xlabel('Time(s)')
    ylabel('Position reference to jumping point(m), Velocity(m/s)')
    hold off

figure(2)
    plot(t,dragForce,'r','LineWidth',2);
    grid
    hold on
    plot(t,weight,'g','LineWidth',2);
    plot(t,tension,'b','LineWidth',2);
    plot(t,ForceNet,'k','LineWidth',2);
    legend('Drag Force','Weight','Tension','net Force');
    xlabel('Time(s)')
    ylabel('Force(N)')
    hold off


figure(3)
    plot(t,kineticEnergy,'r','LineWidth',2);
    grid
    hold on
    plot(t,GravPotentialEnergy,'g','LineWidth',2);
    plot(t,ElasticPotenialEnergy,'b','LineWidth',2);
    plot(t,TotalEnergy,'k','LineWidth',2);
    legend('Kinetic Energy','Gravitational Potential Energy','Elastic Potential Energy','Total Mechanical Energy');
    xlabel('Time(s)')
    ylabel('Energy(J)')
    hold off
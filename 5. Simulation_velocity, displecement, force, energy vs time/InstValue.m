function [InstantVelocity, InstantDisplacement] = InstValue(dt, ti, tf, vi)
    %ti is Initial time, usually zero
    %vi is Initial Velocity, usually zero
    %dt is infinitsimal time, it should be lower than 0.01
    %c is drag coefficent of a person falling
    %m is mass of the person
    %g is value of Earth's gravity
    %L is the length of the rope
    %x is displacement from the jumping point
    %k is the stiffness constant of the rope, we got it from
    %gamma is the damping constant of the rope

    t = ti;  
    v = vi;  
    c=0.25;   
    m=68.1;  
    g = 9.81; 
    L=9.32;
    x=0;
    k = 107.66;
    gamma = 8;
    while(1)
        if t + dt > tf, dt = tf - t; end

        dvdt = acceleration(g, c, m, x, L, k, gamma, v);
        v = v + dvdt * dt;
        x=x+v*dt;
        t = t + dt;

        if t >= tf, break, end
    end
    InstantVelocity = v;
    InstantDisplacement = x;
end
function a = acceleration(g, c, m, x, L, k, gamma, v)

     %While the rope is not streching, no tensional force 
    if x<L
        a=g - (c / m) * v*abs(v);
     %While the rope is streching, tensional force of k*extension and 
                                 % damping force of gamma*velocity
    elseif x>L
        cord = k/m*(x-L)+gamma/m*v;
        a = g - (c / m) * v*abs(v)-cord;
    end
end
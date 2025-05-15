function [f,a,sr] = FindEquation(x,y,N,C1,C2)
    % This function wil find the relation polynomial equation between the two vectors x and y
    % Keep in mind that the two vectors must have the same length
    % a is the coefficent vector
    % N is the degree of the polynomial function
    % sr is the error
    scatter(x,y,C1);
    a=polyfit(x,y,N);
    hold on;
    f=0;
    for i=1:N+1
        f=f+a(i).*x.^(N+1-i);
    end
    plot(x,f,C2,'LineWidth',1.8)
    n=length(x);
    sr=0;
    for i=1:n
        d=y(i);
        for k=1:N+1
            d=d-a(k).*x(i).^(N+1-k);
        end
        sr=sr+(d)^2;
end

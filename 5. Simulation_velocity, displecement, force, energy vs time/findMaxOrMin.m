function [maxORmin_value]=findMaxOrMin(func,n)
    %n=1 for max n=2 for min
    maxORmin_value=0;
    if n==1
        for i=1:250;
            if func(i)>maxORmin_value
                 maxORmin_value=func(i);
            end
        end
    if n==2
        for i=1:250;
            if func(i)<maxORmin_value
                 maxORmin_value=func(i);
            end
        end
    end
end
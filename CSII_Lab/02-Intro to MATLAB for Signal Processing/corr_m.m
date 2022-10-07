function [r] = corr_m(x , y)

if length(y) > length(x) 
    for i = 1 : length(y) - length(x) + 1
        temp = 0;
        for j = 1 : length(x) 
            temp = x(j) * conj(y(j + i - 1)) + temp; 
        end
        r(i) = temp;
    end
    
else
    for i = 1 : length(x) - length(y) + 1
        temp = 0;
        for j = 1 : length(y) 
            temp = y(j) * conj(x(j + i - 1)) + temp; 
        end
        r(i) = temp;
    end


end
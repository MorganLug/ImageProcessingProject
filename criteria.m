function [result] = criteria(x,h,y,alpha)
%CRITERIA calcule le critère à optimiser
    result = norm(y-conv(x,h,'same'));
    for index=1:(length(x)-1)
        result = result + alpha * phi(x,index);
    end
end


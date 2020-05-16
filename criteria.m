function [result] = criteria(x,h,y,alpha,phi)
%CRITERIA calcule le critère à optimiser
    result = norm(y-conv(h,x));
    for i=1:(length(x)-1)
        result = result + alpha * phi(x, i);
    end
end


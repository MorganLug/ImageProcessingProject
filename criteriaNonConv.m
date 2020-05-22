function [result] = criteriaNonConv(x,h,y,alpha,T)
%CRITERIANONCONV calcule le critère à optimiser dans le cas non convexe
    result = norm(y-conv(x,h,'same'));
    for index=1:(length(x)-1)
        result = result + alpha * phiNonConv(x,index,T);
    end
end


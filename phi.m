function [result] = phi(signal,index,T)
%PHI calcule phi
    result = 0;
    if index ~=1
        result = result + sqrt((signal(index)- signal(index-1))^2 + T^2) - T^2;
    end
    if (index ~= length(signal))
        result = result + sqrt((signal(index)- signal(index+1))^2 + T^2) - T^2;
    end
end


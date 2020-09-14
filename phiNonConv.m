function [result] = phiNonConv(signal,index,T)
%PHINONCONV calcule phi cas non convexe
    result = 0;
    if index ~=1
        result = result + min((signal(index)- signal(index-1))^2, T^2);
    end
    if (index ~= length(signal))
        result = result + min((signal(index)- signal(index+1))^2, T^2);
    end
end


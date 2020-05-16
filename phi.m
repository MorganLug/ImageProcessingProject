function [result] = phi(signal,index)
%PHI calcule phi
    result=abs(signal(index+1)-signal(index));
end


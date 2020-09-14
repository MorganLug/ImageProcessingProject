function [sum] = EQM2(x,xrec)
    sum = mean(mean((x-xrec).^2));
end


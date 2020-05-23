function [sum] = EQM2(x,xrec)
%EQM Summary of this function goes here
%   Detailed explanation goes here
    sum = mean(mean((x-xrec).^2));
end


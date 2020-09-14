function [sum] = EQM(x,xrec)
%EQM Summary of this function goes here
%   Detailed explanation goes here
    sum = mean((x-xrec).^2);
end


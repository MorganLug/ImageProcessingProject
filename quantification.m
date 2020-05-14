function [quant_f] = quantification(f)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
quant_f = round(f*2^10)/2^10;  %  q=1/2^10
end


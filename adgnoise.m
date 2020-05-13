function [y] = adgnoise(x,RSB)
%ADGNOISE Summary of this function goes here
%   Detailed explanation goes here
    Px=x'*x/length(x);
    sigma_w=sqrt(Px/(10^(RSB/10)));
    w=sigma_w*randn(N_y,1);
    y=x + w;
end


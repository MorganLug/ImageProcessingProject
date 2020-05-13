function [y] = adgnoise2(x,RSB)
%ADGNOISE2 Summary of this function goes here
%   Detailed explanation goes here
    Px=x'*x/(size(x,1)*size(x,2));
    sigma_w=sqrt(Px/(10^(RSB/10)));
    w=sigma_w*randn(N_y,1);
    y=x + w;
end


function [y] = adgnoise(x,RSB)
%ADGNOISE ajoute bruit blanc gaussien de RSB donné, dim 1
    Px=x'*x/length(x);
    sigma_w=sqrt(Px/(10^(RSB/10)));
    w=sigma_w*randn(length(x),1);
    y=x + w;
end


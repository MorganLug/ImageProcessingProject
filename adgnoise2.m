function [y] = adgnoise2(x,RSB)
%ADGNOISE2 ajoute bruit blanc gaussien de RSB donné, dim 2
    Px=(x(:))'*x(:)/(size(x,1)*size(x,2));
    sigma_w=sqrt(Px/(10^(RSB/10)));
    w=sigma_w*randn(size(x,1),size(x,2));
    y=x + w;
end


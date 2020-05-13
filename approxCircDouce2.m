function [x_rec] = approxCircDouce2(alpha,h,y,d)
%APPROXCIRCDOUCE2 h est un filtre 2D, y un signal 2D, x_rec est la déconvolution
%par la méthode d'aproximation circulante de la matrice de Toeplitz et un
%critère de régularisation/douceur avec alpha et d
    H = fft2(h,size(y,1),size(y,2));
    D = fft2(d,size(y,1),size(y,2));
    H2 = H .* conj(H);
    D2 = D .* conj(D);
    GMCR = conj(H) ./ (H2 + alpha * D2);
    Y = fft2(y);
    X_rec = GMCR .* Y;
    x_rec = real(ifft2(X_rec));
end


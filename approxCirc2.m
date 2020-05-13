function [x_rec] = approxCirc2(h,y)
%APPROXCIRC2 h est un filtre 1D, y un signal 1D, x_rec est la déconvolution
%par la méthode d'aproximation circulaire de la matrice de Toeplitz.
    H = fft2(h,size(y,1),size(y,2));
    GMC = ones(1,size(y,1),size(y,2))./H;
    Y = fft2(y);
    X_rec = GMC .* Y;
    x_rec = real(ifft2(X_rec));
end
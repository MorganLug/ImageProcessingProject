function [x_rec] = approxCirc2(h,y)
%APPROXCIRC2 h est un filtre 2D, y un signal 2D, x_rec est la déconvolution
%par la méthode d'aproximation circulante de la matrice de Toeplitz.
    H = fft2(h,size(y,1),size(y,2));
    GMC = 1./H;
    Y = fft2(y);
    X_rec = GMC .* Y;
    x_rec = real(ifft2(X_rec));
end
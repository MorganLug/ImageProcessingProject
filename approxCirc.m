function [x_rec] = approxCirc(h,y)
%APPROXCIRC h est un filtre 1D, y un signal 1D, x_rec est la déconvolution
%par la méthode d'aproximation circulante de la matrice de Toeplitz.
    H = fft(h,length(y));
    GMC = ones(1,length(y))./H;
    Y = fft(y);
    X_rec = GMC .* Y;
    x_rec = real(ifft(X_rec));
end
function [x_rec] = approxCircDouce(alpha,h,y,d)
%APPROXCIRCDOUCE h est un filtre 1D, y un signal 1D, x_rec est la déconvolution
%par la méthode d'aproximation circulante de la matrice de Toeplitz et un
%critère de régularisation/douceur avec alpha et d
    H = fft(h,length(y));
    D = fft(d,length(y));
    H2 = H .* conj(H);
    D2 = D .* conj(D);
    GMCR = conj(H) ./ (H2 + alpha * D2);
    Y = fft(y);
    X_rec = GMCR .* Y;
    x_rec = real(ifft(X_rec));
end


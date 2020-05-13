function [x_rec] = approxCircDouce2(h,y,alpha)
%APPROXCIRCDOUCE2 Summary of this function goes here
%   Detailed explanation goes here
    H = fft2(h,size(y,1),size(y,2));
    D = fft2([0 -1 0; -1 4 -1; 0 -1 0],size(y,1),size(y,2));
    H2 = H .* conj(H);
    D2 = D .* conj(D);
    GMCR = conj(H) ./ (H2 + alpha * D2);
    Y = fft2(y);
    X_rec = GMCR .* Y;
    x_rec = real(ifft2(X_rec));
end


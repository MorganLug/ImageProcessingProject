function [x_rec] = approxCircDouce(h,y,alpha)
%APPROXCIRCDOUCE Summary of this function goes here
%   Detailed explanation goes here
    H = fft(h,length(y));
    D = fft([1; -1],length(y));
    H2 = H .* conj(H);
    D2 = D .* conj(D);
    GMCR = conj(H) ./ (H2 + alpha * D2);
    Y = fft(y);
    X_rec = GMCR .* Y;
    x_rec = real(ifft(X_rec));
end


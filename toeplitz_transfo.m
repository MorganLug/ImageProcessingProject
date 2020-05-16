function [H] = toeplitz_transfo(h,N_h,N_x,N_y)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
hcol_1 = zeros(1,N_y);
hcol_1(1:N_h) = hcol_1(1:N_h) + h;
hlig_1 = zeros(1,N_x);  
hlig_1(1,1) = hcol_1(1,1);

H = toeplitz(hcol_1,hlig_1);
end


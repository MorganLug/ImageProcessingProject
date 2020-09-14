function [H,conditionnement] = filtToToeplitzCirc(h,N_x)
%FILTTOTOEPLITZ donne l'approximation circulante de la matrice de toeplitz associé au filtre h ainsi que
%son conditionnement dans le cas carré.
    %%%Construction de la matrice de Toeplitz associée
    N_h = length(h);
    N_y = N_x;
    hlig_1 = zeros(1,N_x);
    hcol_1 = zeros(1,N_y);
    hlig_1(1,1)=h(N_h);
    for i=2:N_h
        hlig_1(1,i)=h(N_h+1-i);
        hcol_1(1,N_y+2-i)=h(N_h+1-i);
    end
    hcol_1(1,1) = hlig_1(1);
    H = toeplitz(hcol_1,hlig_1);
    conditionnement=cond(H);
end

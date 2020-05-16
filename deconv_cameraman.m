clear all;
close all;

%Entr�e A
A = imread('cameraman.tif');
A = double(A);

L_h = 5;
%Matrice h de taille L_hxL_h avec des 1, normalis�e
h = 1/(L_h*L_h)*ones(L_h);

%Matrice d
d = [0 -1 0; -1 4 -1; 0 -1 0];

%Sortie B
B = conv2(A,h,'same');
%B = adgnoise(B,30);

figure(1); imagesc(A); colormap gray, colorbar;
figure(2); imagesc(B); colormap gray, colorbar;

%Transform�es de Fourrier de h et d
H = fft2(h,size(A,1),size(A,2));
D = fft2(d,size(A,1),size(A,2));

alpha = .01;


%Calcul des normes au carr�
H2 = H.*conj(H);
D2 = D.*conj(D);
GMCR = conj(H)./(H2+alpha*D2);

Y = fft2(B);
X = Y.*GMCR;

Arec = real(ifft2(X));
figure(3); imagesc(Arec); colormap gray, colorbar;



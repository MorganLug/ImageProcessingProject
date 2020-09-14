clear all
close all

im=im2double(imread('cameraman.tif'));
im= im(1:8:size(im,1),1:8:size(im,2))
lh=5;
h_moy = 1/lh^2 .* ones(lh);
y=conv2(im,h_moy,"same");
d= [0 -1 0; -1 4 -1; 0 -1 0];
y=adgnoise2(y,30);

figure(1);imagesc(im); colormap gray; colorbar;
figure(2);imagesc(y); colormap gray; colorbar;

alpha = 0.001;
x0= zeros(size(y,1),size(y,2));
T=std(im(:))/mean(im(:));

x_rec=approxCirc2(h_moy,y);
x_sol=optimize2(x0,h_moy,y,alpha,T);
figure(3);imagesc(x_rec); colormap gray; colorbar;
figure(4);imagesc(x_sol); colormap gray; colorbar;
signal2Dto1DViz({normalizeImg(im),normalizeImg(x_rec),normalizeImg(x_sol)}, "l", 15, ["Image originale", "Image reconstituée", "Image optimisée"])
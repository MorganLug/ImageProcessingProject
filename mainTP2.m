clear all
close all

im=im2double(imread('cameraman.tif'));
lh=5;
h_moy = 1/lh^2 .* ones(lh);
y=conv2(im,h_moy,"same");
d= [0 -1 0; -1 4 -1; 0 -1 0];
y=adgnoise(y,30);

figure(1);imagesc(im); colormap gray; colorbar;
figure(2);imagesc(y); colormap gray; colorbar;

alpha = 0.01;

x_rec=approxCircDouce2(alpha,h_moy,y,d);
figure(3);imagesc(x_rec); colormap gray; colorbar;

signal2Dto1DViz({im,x_rec}, "l", 43, ["Image originale", "Image reconstituée"])
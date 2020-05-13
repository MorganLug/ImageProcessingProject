clear all
close all

im=im2double(imread('cameraman.tif'));
h_moy = 1/15 .* ones(5,5);
x=conv2(im,h_moy,"same");

clear all
close all

%%%Signaux
%Global
x_triang=x_triang_signal();
h=h_gauss_function(15,15,[0:1:30]);
alpha = 0.01;
T = 0.05;

y_nb=conv(x_triang,h,'same');
y=adgnoise(y_nb,30);

x_approxCirc=approxCirc(h,y);
x_approxCircDouce=approxCircDouce(alpha*10,h,y, [1; -1]);
x0=zeros(length(x_triang),1);
x_optim=optimize(x0,h,y,alpha,T);
x_optimNonConv=optimizeNonConv(x_optim,h,y,alpha,T);

longueur=length(x_triang)-1;
figure(1)
hold on
tiledlayout(2,3)
ax11=nexttile;
plot(ax11,[0:longueur],x_triang);
title(ax11,"x original");
ax12=nexttile;
plot(ax12,[0:longueur],x_approxCirc);
title(ax12,"x par l'approximation circulante");
ax21=nexttile;
plot(ax21,[0:longueur],x_approxCircDouce);
title(ax21,"x par l'approximation circulante douce");
ax22=nexttile;
plot(ax22,[0:longueur],x_optim);
title(ax22,"x par optimisation");
ax22=nexttile;
plot(ax22,[0:longueur],x_optimNonConv);
title(ax22,"x par optimisation non convexe");
hold off
figure(2)
hold on
tiledlayout(2,3)
ax11=nexttile;
plot(ax11,[0:longueur],conv(x_triang,h,'same'));
title(ax11,"x original convolué");
ax12=nexttile;
plot(ax12,[0:longueur],conv(x_approxCirc,h,'same'));
title(ax12,"x par l'approximation circulante convolué");
ax21=nexttile;
plot(ax21,[0:longueur],conv(x_approxCircDouce,h,'same'));
title(ax21,"x par l'approximation circulante douce convolué");
ax22=nexttile;
plot(ax22,[0:longueur],conv(x_optim,h,'same'));
title(ax22,"x par optimisation convolué");
ax22=nexttile;
plot(ax22,[0:longueur],conv(x_optimNonConv,h,'same'));
title(ax22,"x par optimisation non convexe convolué");
hold off

EQM_approxCirc = EQM(x_triang,x_approxCirc)
EQM_approxCircDouce = EQM(x_triang,x_approxCircDouce)
EQM_optim = EQM(x_triang,x_optim)
EQM_optimNonConv = EQM(x_triang,x_optimNonConv)

%Influence Alpha et T sur l'optimisation
alpha=0.0001;
alpha1=alpha;
alpha2=10*alpha;
alpha3=100*alpha;
alpha4=1000*alpha;
T1=0.005;
T2=0.01;
T3=0.05;

figure(3)
tiledlayout(4,3)
ax11=nexttile;
plot(ax11,[0:longueur],optimize(x0,h,y,alpha1,T1));
title(ax11,"\alpha=0.0001, T=0.005");
ax12=nexttile;
plot(ax12,[0:longueur],optimize(x0,h,y,alpha1,T2));
title(ax12,"\alpha=0.0001, T=0.01");
ax13=nexttile;
plot(ax13,[0:longueur],optimize(x0,h,y,alpha1,T3));
title(ax13,"\alpha=0.0001, T=0.05");
ax21=nexttile;
plot(ax21,[0:longueur],optimize(x0,h,y,alpha2,T1));
title(ax21,"\alpha=0.001, T=0.005");
ax22=nexttile;
plot(ax22,[0:longueur],optimize(x0,h,y,alpha2,T2));
title(ax22,"\alpha=0.001, T=0.01");
ax23=nexttile;
plot(ax23,[0:longueur],optimize(x0,h,y,alpha2,T3));
title(ax23,"\alpha=0.001, T=0.05");
ax31=nexttile;
plot(ax31,[0:longueur],optimize(x0,h,y,alpha3,T1));
title(ax31,"\alpha=0.01, T=0.005");
ax32=nexttile;
plot(ax32,[0:longueur],optimize(x0,h,y,alpha3,T2));
title(ax32,"\alpha=0.01, T=0.01");
ax33=nexttile;
plot(ax33,[0:longueur],optimize(x0,h,y,alpha3,T3));
title(ax33,"\alpha=0.01, T=0.05");
ax41=nexttile;
plot(ax41,[0:longueur],optimize(x0,h,y,alpha4,T1));
title(ax41,"\alpha=0.1, T=0.005");
ax42=nexttile;
plot(ax42,[0:longueur],optimize(x0,h,y,alpha4,T2));
title(ax42,"\alpha=0.1, T=0.01");
ax43=nexttile;
plot(ax43,[0:longueur],optimize(x0,h,y,alpha4,T3));
title(ax43,"\alpha=0.1, T=0.05");
hold off

%Influence Alpha et T sur l'optimisation non convexe
x0=optimize(x0,h,y,alpha3,T1); %à mieux régler

figure(4)
tiledlayout(4,3)
ax11=nexttile;
plot(ax11,[0:longueur],optimizeNonConv(x0,h,y,alpha1,T1));
title(ax11,"\alpha=0.0001, T=0.005");
ax12=nexttile;
plot(ax12,[0:longueur],optimizeNonConv(x0,h,y,alpha1,T2));
title(ax12,"\alpha=0.0001, T=0.01");
ax13=nexttile;
plot(ax13,[0:longueur],optimizeNonConv(x0,h,y,alpha1,T3));
title(ax13,"\alpha=0.0001, T=0.05");
ax21=nexttile;
plot(ax21,[0:longueur],optimizeNonConv(x0,h,y,alpha2,T1));
title(ax21,"\alpha=0.001, T=0.005");
ax22=nexttile;
plot(ax22,[0:longueur],optimizeNonConv(x0,h,y,alpha2,T2));
title(ax22,"\alpha=0.001, T=0.01");
ax23=nexttile;
plot(ax23,[0:longueur],optimizeNonConv(x0,h,y,alpha2,T3));
title(ax23,"\alpha=0.001, T=0.05");
ax31=nexttile;
plot(ax31,[0:longueur],optimizeNonConv(x0,h,y,alpha3,T1));
title(ax31,"\alpha=0.01, T=0.005");
ax32=nexttile;
plot(ax32,[0:longueur],optimizeNonConv(x0,h,y,alpha3,T2));
title(ax32,"\alpha=0.01, T=0.01");
ax33=nexttile;
plot(ax33,[0:longueur],optimizeNonConv(x0,h,y,alpha3,T3));
title(ax33,"\alpha=0.01, T=0.05");
ax41=nexttile;
plot(ax41,[0:longueur],optimizeNonConv(x0,h,y,alpha4,T1));
title(ax41,"\alpha=0.1, T=0.005");
ax42=nexttile;
plot(ax42,[0:longueur],optimizeNonConv(x0,h,y,alpha4,T2));
title(ax42,"\alpha=0.1, T=0.01");
ax43=nexttile;
plot(ax43,[0:longueur],optimizeNonConv(x0,h,y,alpha4,T3));
title(ax43,"\alpha=0.1, T=0.05");
hold off

%%%Images
%Global
im=im2double(imread('cameraman.tif'));
x_triang = im(1:8:size(im,1),1:8:size(im,2));
lh=5;
h = 1/lh^2 .* ones(lh);
alpha = 0.01;
T = 0.05;

y=conv2(x_triang,h,"same");
d= [0 -1 0; -1 4 -1; 0 -1 0];
y=adgnoise2(y,30);

x_approxCirc=approxCirc2(h,y);
x_approxCircDouce=approxCircDouce2(alpha*10,h,y, d);
x0=zeros(size(y,1),size(y,2));
x_optim=optimize2(x0,h,y,alpha,T);
x_optimNonConv=optimizeNonConv2(x_optim,h,y,alpha,T);

longueur=length(x_triang)-1;
figure(5)
hold on
tiledlayout(2,3)
ax11=nexttile;
imagesc(ax11,x_triang); colormap gray; colorbar;
title(ax11,"x original");
ax12=nexttile;
imagesc(ax12,x_approxCirc); colormap gray; colorbar;
title(ax12,"x par l'approximation circulante");
ax21=nexttile;
imagesc(ax21,x_approxCircDouce); colormap gray; colorbar;
title(ax21,"x par l'approximation circulante douce");
ax22=nexttile;
imagesc(ax22,x_optim); colormap gray; colorbar;
title(ax22,"x par optimisation");
ax22=nexttile;
imagesc(ax22,x_optimNonConv); colormap gray; colorbar;
title(ax22,"x par optimisation non convexe");
hold off
figure(6)
hold on
tiledlayout(2,3)
ax11=nexttile;
imagesc(ax11,conv2(x_triang,h,'same'));colormap gray; colorbar;
title(ax11,"x original convolué");
ax12=nexttile;
imagesc(ax12,conv2(x_approxCirc,h,'same'));colormap gray; colorbar;
title(ax12,"x par l'approximation circulante convolué");
ax21=nexttile;
imagesc(ax21,conv2(x_approxCircDouce,h,'same'));colormap gray; colorbar;
title(ax21,"x par l'approximation circulante douce convolué");
ax22=nexttile;
imagesc(ax22,conv2(x_optim,h,'same'));colormap gray; colorbar;
title(ax22,"x par optimisation convolué");
ax22=nexttile;
imagesc(ax22,conv2(x_optimNonConv,h,'same'));colormap gray; colorbar;
title(ax22,"x par optimisation non convexe convolué");
hold off

EQM_approxCirc2 = EQM2(x_triang,x_approxCirc)
EQM_approxCircDouce2 = EQM2(x_triang,x_approxCircDouce)
EQM_optim2 = EQM2(x_triang,x_optim)
EQM_optimNonConv2 = EQM2(x_triang,x_optimNonConv)

signal2Dto1DViz({normalizeImg(x_triang),normalizeImg(x_approxCirc),normalizeImg(x_approxCircDouce),normalizeImg(x_optim),normalizeImg(x_optimNonConv)}, "l", 15, ["Image originale", "Approximation Circulante", "Approximation Circulante douce", "Optimisation", "Optimisation Non Convexe"])


%Influence Alpha et T sur l'optimisation
alpha=0.0001;
alpha1=alpha;
alpha2=10*alpha;
alpha3=100*alpha;
alpha4=1000*alpha;
T1=0.005;
T2=0.01;
T3=0.05;

figure(7)
tiledlayout(4,3)
ax11=nexttile;
imagesc(ax11,optimize2(x0,h,y,alpha1,T1));colormap gray; colorbar;
title(ax11,"\alpha=0.0001, T=0.005");
ax12=nexttile;
imagesc(ax12,optimize2(x0,h,y,alpha1,T2));colormap gray; colorbar;
title(ax12,"\alpha=0.0001, T=0.01");
ax13=nexttile;
imagesc(ax13,optimize2(x0,h,y,alpha1,T3));colormap gray; colorbar;
title(ax13,"\alpha=0.0001, T=0.05");
ax21=nexttile;
imagesc(ax21,optimize2(x0,h,y,alpha2,T1));colormap gray; colorbar;
title(ax21,"\alpha=0.001, T=0.005");
ax22=nexttile;
imagesc(ax22,optimize2(x0,h,y,alpha2,T2));colormap gray; colorbar;
title(ax22,"\alpha=0.001, T=0.01");
ax23=nexttile;
imagesc(ax23,optimize2(x0,h,y,alpha2,T3));colormap gray; colorbar;
title(ax23,"\alpha=0.001, T=0.05");
ax31=nexttile;
imagesc(ax31,optimize2(x0,h,y,alpha3,T1));colormap gray; colorbar;
title(ax31,"\alpha=0.01, T=0.005");
ax32=nexttile;
imagesc(ax32,optimize2(x0,h,y,alpha3,T2));colormap gray; colorbar;
title(ax32,"\alpha=0.01, T=0.01");
ax33=nexttile;
imagesc(ax33,optimize2(x0,h,y,alpha3,T3));colormap gray; colorbar;
title(ax33,"\alpha=0.01, T=0.05");
ax41=nexttile;
imagesc(ax41,optimize2(x0,h,y,alpha4,T1));colormap gray; colorbar;
title(ax41,"\alpha=0.1, T=0.005");
ax42=nexttile;
imagesc(ax42,optimize2(x0,h,y,alpha4,T2));colormap gray; colorbar;
title(ax42,"\alpha=0.1, T=0.01");
ax43=nexttile;
imagesc(ax43,optimize2(x0,h,y,alpha4,T3));colormap gray; colorbar;
title(ax43,"\alpha=0.1, T=0.05");
hold off


%Influence Alpha et T sur l'optimisation non convexe
x0=optimize2(x0,h,y,alpha3,T1); %à mieux régler

figure(8)
tiledlayout(4,3)
ax11=nexttile;
imagesc(ax11,optimizeNonConv2(x0,h,y,alpha1,T1));colormap gray; colorbar;
title(ax11,"\alpha=0.0001, T=0.005");
ax12=nexttile;
imagesc(ax12,optimizeNonConv2(x0,h,y,alpha1,T2));colormap gray; colorbar;
title(ax12,"\alpha=0.0001, T=0.01");
ax13=nexttile;
imagesc(ax13,optimizeNonConv2(x0,h,y,alpha1,T3));colormap gray; colorbar;
title(ax13,"\alpha=0.0001, T=0.05");
ax21=nexttile;
imagesc(ax21,optimizeNonConv2(x0,h,y,alpha2,T1));colormap gray; colorbar;
title(ax21,"\alpha=0.001, T=0.005");
ax22=nexttile;
imagesc(ax22,optimizeNonConv2(x0,h,y,alpha2,T2));colormap gray; colorbar;
title(ax22,"\alpha=0.001, T=0.01");
ax23=nexttile;
imagesc(ax23,optimizeNonConv2(x0,h,y,alpha2,T3));colormap gray; colorbar;
title(ax23,"\alpha=0.001, T=0.05");
ax31=nexttile;
imagesc(ax31,optimizeNonConv2(x0,h,y,alpha3,T1));colormap gray; colorbar;
title(ax31,"\alpha=0.01, T=0.005");
ax32=nexttile;
imagesc(ax32,optimizeNonConv2(x0,h,y,alpha3,T2));colormap gray; colorbar;
title(ax32,"\alpha=0.01, T=0.01");
ax33=nexttile;
imagesc(ax33,optimizeNonConv2(x0,h,y,alpha3,T3));colormap gray; colorbar;
title(ax33,"\alpha=0.01, T=0.05");
ax41=nexttile;
imagesc(ax41,optimizeNonConv2(x0,h,y,alpha4,T1));colormap gray; colorbar;
title(ax41,"\alpha=0.1, T=0.005");
ax42=nexttile;
imagesc(ax42,optimizeNonConv2(x0,h,y,alpha4,T2));colormap gray; colorbar;
title(ax42,"\alpha=0.1, T=0.01");
ax43=nexttile;
imagesc(ax43,optimizeNonConv2(x0,h,y,alpha4,T3));colormap gray; colorbar;
title(ax43,"\alpha=0.1, T=0.05");
hold off


% %images
% 
% im=im2double(imread('cameraman.tif'));
% im = im(1:8:size(im,1),1:8:size(im,2))
% lh=5;
% h_moy = 1/lh^2 .* ones(lh);
% y=conv2(im,h_moy,"same");
% d= [0 -1 0; -1 4 -1; 0 -1 0];
% y=adgnoise2(y,30);
% 
% figure(1);imagesc(im); colormap gray; colorbar;
% figure(2);imagesc(y); colormap gray; colorbar;
% 
% alpha = 0.001;
% x0= zeros(size(y,1),size(y,2));
% T=std(im(:))/mean(im(:));
% 
% x_rec=approxCircDouce2(alpha,h_moy,y,d);
% x_sol=optimize2(x0,h_moy,y,alpha,T);
% figure(3);imagesc(x_rec); colormap gray; colorbar;
% figure(4);imagesc(x_sol); colormap gray; colorbar;
% signal2Dto1DViz({normalizeImg(im),normalizeImg(x_rec),normalizeImg(x_sol)}, "l", 15, ["Image originale", "Image reconstituée", "Image optimisée"])
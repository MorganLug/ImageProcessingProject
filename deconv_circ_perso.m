%-------------------------------------------------------------------------
%----- Fichier : deconv_circ_perso
%----- Objet   : Déconvolution par moindres carrés régularisés ou non
%----- Références principales : Idier
%-------------------------------------------------------------------------

close all;
clear all;

L_x = 100;	    % durée d'observation du signal d'entrée
fe = 1;		    % fréquence d'échantillonage
Te = 1/fe;		% période d'échantillonage
N_x = L_x/Te;	% nombre de points du signal x
k_x = 0:N_x-1;	% index temporel
t_x= k_x*Te;    % base de temps
%**************************************************************************
% 1. Signal x
x = x_triang_signal();

subplot(2,3,1)
plot(t_x,x);
xlabel('temps (s)'); ylabel('amplitude'); title('Signal entrée x(t)');


%**************************************************************************
% 2. Réponse impulsionnelle h de filtres linéaires gaussiens


%**************************************************************************
% Construction d'un seul filtre gaussien
%**************************************************************************
mu_h=15*Te;
sigma=4;
sigma_h=sigma*Te;
L_h=30*Te;
t_h=(0:Te:L_h-1);
N_h=length(t_h);
h=h_gauss_function(mu_h,sigma_h,t_h);
subplot(2,3,2)
plot(t_h,h)
xlabel('temps (s)'); ylabel('amplitude'); title('Réponse impulsionnelle h(t)');

%--------------------------------------------------------------------------
%-
% 3. Construction de la matrice H de convolution (Toeplitz)

N_y = N_x;

H = toeplitz_transfo(h,N_h,N_x,N_y);
cond_H(sigma)=cond(H);

y_nb=H*x;
y = quantification(y_nb);

% subplot(2,3,6)
% plot(t_x,y_nb)
% xlabel('temps (s)'); ylabel('amplitude'); title('Signal de sortie (sans bruit, i.e. y_nb');

subplot(2,3,3)
plot(t_x,y)
xlabel('temps (s)'); ylabel('amplitude'); title('Signal de sortie');




% Séance 2
% 4. Construction de Lambda_h

Lambda_h = fft(H(1,:),N_x);

% 5.Contruction de g_MC

g_MC=1./Lambda_h;

% 6.Construction de Y

Y=fft(y,N_x);

% 7.Contruction de X_tild

X_tild=diag(g_MC)*Y;

% 8.Retour à x_tild

x_tild=ifft(X_tild);

subplot(2,3,4)
plot(t_x,x_tild)
xlabel('temps (s)'); ylabel('amplitude'); title('Signal d''entrée reconstruit');



% 1.Calcul de Lambda_d

Lambda_hh=Lambda_h.';

Lambda_d=fft([1;-1],N_x);

alpha = .01;

% 2.Calcul de g_MCR;

Lambda_h_2 = Lambda_hh.*conj(Lambda_hh);
Lambda_d_2 = Lambda_d.*conj(Lambda_d);

g_MCR = conj(Lambda_hh)./(Lambda_h_2 + alpha*Lambda_d_2);

% 3.Calcul de X_titild

X_titild=diag(g_MCR)*Y;

% 4.Retour à x_titild

x_titild=ifft(X_titild);

subplot(2,3,5)
plot(t_x,x_titild)
xlabel('temps (s)'); ylabel('amplitude'); title('Signal d''entrée reconstruit');


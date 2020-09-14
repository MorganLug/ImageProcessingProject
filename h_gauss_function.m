function [h] = h_gauss_function(mu_h,sigma_h,t_h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


fe = 1;		    % fréquence d'échantillonnage (Hz)
Te = 1/fe;		% période d'échantillonnage



% mu_h=15*Te;
% la largeur de la réponse impulsionnelle va rendre le problème plus ou
% moins difficile
% sigma_h=5*Te;



%t_h=(0:Te:30*Te);
h=(1/(sigma_h*sqrt(2*pi)))*exp(-(((t_h-mu_h)/(sqrt(2)*sigma_h)).*((t_h-mu_h)/(sqrt(2)*sigma_h))))';

%plot(tt,h);
%xlabel('temps (s)'); ylabel('amplitude'); title('Réponse impulsionnelle h(t)');
end


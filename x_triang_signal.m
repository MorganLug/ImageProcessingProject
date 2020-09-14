function [x] = x_triang_signal()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


L_x = 100;	    % dur�e d'observation du signal d'entr�e (en s)
fe = 1;		    % fr�quence d'�chantillonnage (Hz)
Te = 1/fe;		% p�riode d'�chantillonnage
N_x = L_x/Te;	% nombre de points du signal x
k_x = 0:N_x;	    % vecteur des indices temporels  
t_x= k_x*Te;		% vecteur des instants d'�chantillonnage


k1 = 0:N_x/2-1;
t1 = k1*Te;
x1 = t1/(L_x/2); 

k2 = N_x/2:N_x-1;
t2 = k2*Te;
x2 = (-t2 + L_x)/(L_x/2);

x = [x1'; x2']; %101x1 matrix

%plot(tx,x);
%xlabel('temps (s)'); ylabel('amplitude'); title('Signal entr�e x(t)');
end


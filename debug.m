clear all
close all

x_triang=x_triang_signal();
h=h_gauss_function(15,15,[0:1:30]);
alpha = 0.0001;
T = 0.01;

y_nb=conv(x_triang,h,'same');
y=adgnoise(y_nb,30);

H = fft(h,length(y));
length(h)
GMC = 1./H;
Y = fft(y,length(y));
X_rec = GMC .* Y;
x_rec = real(ifft(X_rec));
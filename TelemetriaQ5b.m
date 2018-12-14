% clear;
% clc;
load handel.mat
n = input('N?mero de bits: ');
Y = y;
sL = 0.8;
L = 0;
MSEn = 0;
for j=1:(2^n)
    for i=1:max(size(Y))
        if abs(Y(i)) >= L
            if abs(Y(i)) <= (L+sL)
                Y_n(i) = sign(Y(i))*L;
                MSEn = MSEn + (Y_n(i) - Y(i))^2;
             end
         end
     end
     L = L + sL;
end
    
MSEn = MSEn/max(size(MSEn))
figure(1);
hold on;
plot(Y_n);
title('Quantizador de 8 bits');

filename = 'handel.wav';
audiowrite(filename,Y_n,Fs);
clear y Fs
[z,Fs] = audioread('handel.wav');
sound(z,Fs);
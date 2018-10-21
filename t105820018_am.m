clear all;
close all;

[ym fm]=audioread('derjk.wav');
ym=ym*70;
ym=ym';
ym(1,:)=[];
ym(144002:length(ym))=[];
t = 0:1/fm:3;
subplot(3,1,1);
plot(t,ym)
title('modulationg signal');

%carrier signal
Ac=1;
fc=30;
yc=Ac*cos(2*pi*fc*t);
subplot(3,1,2)
plot(t,yc)
title('carrier signal');

%AM modulation
y=Ac.*(1+1*ym).*cos(2*pi*fc*t);
subplot(3,1,3)
plot(t,y)
title('AM signal')

figure;
plot(linspace(-fm/2,fm/2,length(y)),abs(fftshift(fft(y))));

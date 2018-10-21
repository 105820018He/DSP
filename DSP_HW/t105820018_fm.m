clear all;
close all;

%message
[ym fm]=audioread('derjk.wav');
ym=ym';
ym(1,:)=[];
ym(6002:length(ym))=[];
fm=fm/24;
t = 0:1/fm:3;
subplot(3,1,1);
plot(t,ym)
title('modulationg signal');

%carrier
Ac=1;
fc=30;
yc=Ac*cos(2*pi*fc*t);
subplot(3,1,2)
plot(t,yc)
title('carrier signal');

%FM
%y=Ac*cos(2*pi*fc*t + cumsum(2*pi*1*cos(2*pi*fm*t)));
y=Ac*cos(2*pi*fc*t + cumsum(2*pi*1*ym));
subplot(3,1,3)
plot(t,y)
title('FM signal')

figure;
plot(linspace(-fm/2,fm/2,length(y)),abs(fftshift(fft(y))));


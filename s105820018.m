clear all;
close all;

%音樂頻譜
[x fs1]=audioread('hu.mp3');
[y fs2]=audioread('derjk.wav');

figure;
set(figure(1),'NumberTitle','off','Name','BGM') 
title('BGM')
subplot(2,2,1);
plot(x(1:100000,:))
subplot(2,2,2);
x2=fftshift(fft(x));
plot(abs(x2))
subplot(2,2,3);
spectrogram(x(:,1),'yaxis')
subplot(2,2,4);
specgram(x(:,1))

figure;
set(figure(2),'NumberTitle','off','Name','Recording') 
subplot(2,2,1);
plot(y(1:100000,:))
title('derjk')
subplot(2,2,2);
y2=fftshift(fft(y));
plot(abs(y2))
subplot(2,2,3);
spectrogram(y(:,1),'yaxis')
subplot(2,2,4);
specgram(y(:,1))


%音檔之最大、最小、平均值
MIN=min(y);
MAX=max(y);
MEAN=mean(y);
Y=y*10;   %振幅增加
audiowrite('derjk1.wav',Y,fs2);
audiowrite('derjk2.wav',Y,fs2*0.5);
audiowrite('derjk3.wav',Y,fs2*1.5);


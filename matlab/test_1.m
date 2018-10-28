clear;
close all;

cd 'C:\Users\Yan\Desktop\project\data\test_1024'    %檔案路徑
data = xlsread('test_4.xlsx');  %讀取檔案
data=data'; %將檔案轉置
real_data=data;     
time=data(1,:);     %只取時間
data=data(2,:);     %只取數值

human_resistance=((1024+2.*data).*10000)./(512.-data);      %換算成人體阻抗

fs=length(time)/time(1,length(time));   %取樣頻率   總信號取樣數/時間
%T=time(1,length(time));                  
%f=1/T;
%fx=linspace(-f,f,length(time));
N=length(data);                         %信號長度

%w=linspace(0,2*pi/length(time),length(time));
freqHz=linspace(-fs/2,fs/2,N);          %頻譜的x軸

human_resistance_fft=fft(human_resistance);
human_resistance_fft_shift =fftshift(human_resistance_fft);

data_fft=fft(data);                     %傅立葉轉換
data_fft=fftshift(data_fft);            %平移

subplot(2,1,1);
plot(time,data);                        %繪圖
axis([0,inf,0,512]);
title('Data的波形圖');
xlabel('時間(s)');
ylabel('震幅');

subplot(2,1,2);
plot( freqHz,abs(data_fft));           %繪圖
axis([-2,2,0,10000]);
title('Data的頻譜圖');
xlabel('頻率(f)');
ylabel('震幅');

%figure; plot( freqHz,abs(human_resistance_fft_shift));
%axis([-2,2,0,10000000]);

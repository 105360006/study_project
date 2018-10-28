clear;
close all;

cd 'C:\Users\Yan\Desktop\project\data\test_1024'    %�ɮ׸��|
data = xlsread('test_4.xlsx');  %Ū���ɮ�
data=data'; %�N�ɮ���m
real_data=data;     
time=data(1,:);     %�u���ɶ�
data=data(2,:);     %�u���ƭ�

human_resistance=((1024+2.*data).*10000)./(512.-data);      %���⦨�H�����

fs=length(time)/time(1,length(time));   %�����W�v   �`�H�����˼�/�ɶ�
%T=time(1,length(time));                  
%f=1/T;
%fx=linspace(-f,f,length(time));
N=length(data);                         %�H������

%w=linspace(0,2*pi/length(time),length(time));
freqHz=linspace(-fs/2,fs/2,N);          %�W�Ъ�x�b

human_resistance_fft=fft(human_resistance);
human_resistance_fft_shift =fftshift(human_resistance_fft);

data_fft=fft(data);                     %�ť߸��ഫ
data_fft=fftshift(data_fft);            %����

subplot(2,1,1);
plot(time,data);                        %ø��
axis([0,inf,0,512]);
title('Data���i�ι�');
xlabel('�ɶ�(s)');
ylabel('�_�T');

subplot(2,1,2);
plot( freqHz,abs(data_fft));           %ø��
axis([-2,2,0,10000]);
title('Data���W�й�');
xlabel('�W�v(f)');
ylabel('�_�T');

%figure; plot( freqHz,abs(human_resistance_fft_shift));
%axis([-2,2,0,10000000]);

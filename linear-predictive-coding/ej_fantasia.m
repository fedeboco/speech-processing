clear all, close all;

%cargo audio y ventaneo
audio_orig = audioread('.\Practicas\4 - Linear predictive coding\fantasia.wav');
info_wav = audioinfo('.\Practicas\4 - Linear predictive coding\fantasia.wav');
Fs = info_wav.SampleRate; %frecuencia de muestreo
Ts = 1/Fs;
L=0.025; %25 ms, tiempo de la ventana
N = L*Fs; %Largo de la ventana
muestra_inicial = 14000; %empiezo en una vocal determinada
muestra_final = 14000+N; %termino en la ventana
audio = audio_orig(muestra_inicial:muestra_final);

%ploteo audio
figure('units','normalized','outerposition',[0.1 0.1 0.8 0.8])
subplot(2,2,1)
t1 = ((0:length(audio)-1)*Ts)';
plot(t1*1000, audio)
title('Señal a partir de 14000')
xlabel('Tiempo [ms]')
ylabel('Amplitud')
grid

%calculo autocorrelacion
corr = xcorr(audio);
lag = ((-length(corr)/2:(length(corr)-1)/2)*Ts)'; %eje de tiempo
subplot(2,2,2)
plot(lag*1000, corr)
title('Autocorrelacion')
xlabel('Lag [ms]')
ylabel('Autocorrelación')

%calculo matriz de autocorrelacion
M=20; %muestras para calcular autocorrelacion
ro = corr(N+1:N+M); %autocorrelacion de 0 a M-1
y = corr(N+2:N+M+1); %autocorrelacion de 1 a M
R = toeplitz(ro); %matriz de autocorrelacion
B = inv(R)*y; %R*B=y  ----> B=Rinv*y

%filtro
s_filt = filter([0 B'],1,audio);
error = audio-s_filt;
subplot(2,2,3)
hold on
plot(t1*1000, audio,'linestyle',':')
plot(t1*1000, s_filt)
plot(t1*1000, error)
hold off
legend('Original','Filtrada','Error')
title('Señal reconstruida con b_i y Error')
xlabel('Tiempo [ms]')
ylabel('Amplitud')
grid

%rta en frecuencia
S = fft(audio);
G = sqrt(ro(1)-B'*y); %calculo ganancia
S_aprox = freqz(G,[1 -B'],N,'whole'); %evalua en el circulo unitario para obtener H=G/(1-b1*z^-1......)
subplot(2,2,4)
hold on
fourier_len = floor(length(S)/2);
f = ((0:fourier_len-1)/2*Fs/fourier_len)';
plot(f/1000, abs(S(1:fourier_len)))
plot(f/1000, abs(S_aprox(1:fourier_len)))
hold off
legend('fft(Fantasia(n))','Filtro H(z)')
title('Respuesta en frecuencia')
xlabel('Frecuencia [kHz]')
ylabel('Valor absoluto')
grid

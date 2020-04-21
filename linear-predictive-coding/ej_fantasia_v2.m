%enviar a pelle.patricia@gmail.com antes del 9/4 a las 16.

clear all, close all;

%cargo audio y ventaneo
audio_orig = audioread('.\fantasia.wav');
info_wav = audioinfo('.\fantasia.wav');
Fs = info_wav.SampleRate; %frecuencia de muestreo
Ts = 1/Fs;
L = 0.025; %25 ms, tiempo de la ventana
N = L*Fs; %Largo de la ventana en muestras

%Puntos 1 y 2
muestra_inicial = 14000; %empiezo en una vocal determinada
muestra_final = 14000+N; %termino en la ventana
audio = audio_orig(muestra_inicial:muestra_final);
[B,G,corr,s_filt,S,S_aprox,error] = calc_coef(N,audio,0);
plotear(audio,Ts,Fs,corr,S,S_aprox,s_filt,error)

%Punto 3
muestra_inicial = 11000; %empiezo en primera vocal "a"
muestra_final = 11000+N; %termino en la ventana
audio1 = audio_orig(muestra_inicial:muestra_final);
[B1,G1,corr1,s_filt1,S1,S_aprox1,error1] = calc_coef(N,audio1,0);

muestra_inicial = 14000; %empiezo en segunda vocal "a"
muestra_final = 14000+N; %termino en la ventana
audio1 = audio_orig(muestra_inicial:muestra_final);
[B2,G2,corr2,s_filt2,S2,S_aprox2,error2] = calc_coef(N,audio1,0);

muestra_inicial = 18840; %empiezo en vocal "i"
muestra_final = 18840+N; %termino en la ventana
audio1 = audio_orig(muestra_inicial:muestra_final);
[B3,G3,corr3,s_filt3,S3,S_aprox3,error3] = calc_coef(N,audio1,0);

muestra_inicial = 21400; %empiezo en tercera vocal "a"
muestra_final = 21400+N; %termino en la ventana
audio1 = audio_orig(muestra_inicial:muestra_final);
[B4,G4,corr4,s_filt4,S4,S_aprox4,error4] = calc_coef(N,audio1,0);

figure
hold on
fourier_len = floor(length(S)/2);
f = ((0:fourier_len-1)/2*Fs/fourier_len)';
plot(f/1000, abs(S_aprox1(1:fourier_len)))
plot(f/1000, abs(S_aprox2(1:fourier_len)))
plot(f/1000, abs(S_aprox3(1:fourier_len)))
plot(f/1000, abs(S_aprox4(1:fourier_len)))
hold off
legend('1era a','2da a','i','3era a')
title('Envolvente, respuesta del filtro H(z)')
xlabel('Frecuencia [kHz]')
ylabel('Valor absoluto')
grid

%Punto 4
matB = []; vectG = []; matS_aprox = []; error_total = []; s_filt_total = []; zi=0;
for i=1:N/2:length(audio_orig)-N
    muestra_inicial = i;
    muestra_final = i+N;
    audio = audio_orig(muestra_inicial:muestra_final);
    [B,G,corr,s_filt,S,S_aprox,error,zf] = calc_coef(N,audio,zi);
    matB = [matB B];
    vectG = [vectG G];
    matS_aprox = [matS_aprox S_aprox];
    error_total = [error_total; error(1+10:N/2+10)]; %N/2 porque en la sig se pisa.
    s_filt_total = [s_filt_total; s_filt(1:N/2)];
    zi = zf;
end

figure('units','normalized','outerposition',[0.1 0.2 0.8 0.7])
subplot(1,2,1)

t_surf = 0:L/2:214*L/2; %hasta 2.675 segs, descarto ventana final para simpl.
matS_aprox = matS_aprox(1:200,:); %tomo la mitad de la rta en frec
h = surf(t_surf,f/1000,20*log10(abs(matS_aprox)),'EdgeColor','none');
view(2)
xlabel('Time [secs]')
ylabel('Frequency [kHz]')
axis([0 2.675 0 inf])

title('Superficie aproximada')

subplot(1,2,2)
ventana = N;
dft_pts = N;
noverlap = floor(N/2);
spectrogram(audio_orig,ventana,noverlap,dft_pts,Fs,'power','yaxis');
colormap('spring')

title('Espectrograma de señal original')

%Puntos 5 y 6
figure('units','normalized','outerposition',[0.1 0.2 0.8 0.7])
subplot(1,2,1)
hold on

plot((0:length(audio_orig)-1)*Ts, audio_orig)
plot((0:length(s_filt_total)-1)*Ts, s_filt_total)
hold off
legend('Señal original','Obtenida por filtro inverso');
xlabel('Tiempo [s]')
ylabel('Intensidad')
title('Original vs aproximada')
grid

subplot(1,2,2)
plot((0:length(error_total)-1)*Ts, error_total)
legend('Error')
xlabel('Tiempo [s]')
ylabel('Intensidad')
title('Error de aproximación')
grid
axis([0 inf -0.6 0.6])

audiowrite('.\reconstruida.wav',s_filt_total,16000);

%round(e_normalizado(n).255)
%e_normalizado es entre 0 y 1.
%filtro que reconstruye con el error [s_r] = filter(1,[1 -B'],error);
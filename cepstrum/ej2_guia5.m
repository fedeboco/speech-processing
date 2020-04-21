close all;
F = [660 1720 2410 3500 4500];
sigma = [60 100 120 175 250];
gamma = 0.96; %Coeficiente de rad. labial
Fs = 16000;
T = 1/Fs; %s
F0 = 125; %Hz frec. fundamental

%% Tren de deltas
t = 0:1/Fs:1;     %tiempo
p = zeros(size(t));
p(1:Fs/F0:end) = 1;

figure
plot(t,p)
title({'Tren de deltas';'125Hz durante 1s'})
xlabel('t [s]')

%% Calculo coeficientes de segundo orden
a = -2*exp(-2*pi.*sigma*T).*cos(2*pi.*F*T);
b = exp(-4*pi.*sigma*T);
S1 = filter(1, [1 a(1) b(1)], p);
S2 = filter(1, [1 a(2) b(2)], S1);
S3 = filter(1, [1 a(3) b(3)], S2);
S4 = filter(1, [1 a(4) b(4)], S3);
S5 = filter(1, [1 a(5) b(5)], S4);

RS = filter([1 -gamma], 1, S5);

figure
f = 1:Fs/25000:Fs;
S_ceps = fft(RS,length(f));
plot(f, abs(S_ceps))
title('Respuesta del filtro al tren de deltas')
xlabel('t [s]')

figure
s_cep = ifft(log(S_ceps));
plot(f, s_cep)
title({'Cepstrum';'Sin liftering'})
xlabel('t [s]')

%% Grafico envolvente luego de aplicar liftering
%Aproximadamente en la muestra 100 aparece la primer delta
n_lift = 100;
lift_win = [ones(1,n_lift) zeros(1,length(S_ceps)-2*n_lift) ones(1,n_lift)];
s_ceps_lift = lift_win.*s_cep;
envolvente = abs(exp((fft(s_ceps_lift))));

figure
plot(f, envolvente)
title({'Envolvente del filtro';'(Luego de aplicar liftering removiendo deltas)'})

%% Espectro de cceps()+liftering
ceps_matlab = cceps(RS,25000);
n_lift = 100;
lift_win = [ones(1,n_lift) zeros(1,length(ceps_matlab)-2*n_lift) ones(1,n_lift)];
cm_lift = ceps_matlab.*lift_win;
lcm = abs(exp(fft(cm_lift))); %liftered cepstrum matlab

figure
plot(lcm)
title({'Envolvente de cepstrum con cceps()';'Con liftering'})
%% Exporto audio
%audiowrite('s1.wav', S5, Fs);



function void = plotear(audio, Ts, Fs, corr, S, S_aprox, s_filt, error)
    %ploteo audio
    figure('units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    subplot(2,2,1)
    t1 = ((0:length(audio)-1)*Ts)';
    plot(t1*1000, audio)
    title('Señal a partir de 14000')
    xlabel('Tiempo [ms]')
    ylabel('Amplitud')
    grid

    %ploteo correlacion
    lag = ((-length(corr)/2:(length(corr)-1)/2)*Ts)'; %eje de tiempo
    subplot(2,2,2)
    plot(lag*1000, corr)
    title('Autocorrelacion')
    xlabel('Lag [ms]')
    ylabel('Autocorrelación')

    %ploteo filtro+audio+error
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

    %ploteo rta en frec
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
end
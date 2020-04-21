function [B,G,corr,s_filt,S,S_aprox,error,zfe,zfs] = calc_coef_total(N, M, audio,zie,zis);
   digits(2)
   corr = xcorr(audio);
   s_filt=0;
   S = fft(audio);
   
   %calculo matriz de autocorrelacion
   ro = corr(N+1:N+M); %autocorrelacion de 0 a M-1. desde N porque es donde esta el 0 de la autocorr
   y = corr(N+2:N+M+1); %autocorrelacion de 1 a M
   R = toeplitz(ro); %matriz de autocorrelacion
   B = inv(R)*y; %R*B=y  ----> B=Rinv*y coeficientes bi
   
   %calculo filtro
   if(zie==0)
    zie = zeros(1,max(length(1),length([0 B']))-1.); %para la primera cond inicial
    zis = zeros(1,max(length(1),length([0 B']))-1.);
   end
    audio = audio(1:M);
   [error, zfe] = filter([1 -B'],1,audio,zie); %filtro directo
   [s_filt, zfs] = filter(1,[1 -B'],error,zis); %filtro inverso
      
   %calculo rta en frec
   G = sqrt(ro(1)-B'*y); %calculo ganancia
   S_aprox = freqz(G,[1 -B'],N,'whole'); %evalua en el circulo unitario para obtener H=G/(1-b1*z^-1......)
end
function [B,G,corr,s_filt,S,S_aprox,error,zf] = calc_coef(N, audio,zi);
   digits(2)
   corr = xcorr(audio);
   s_filt=0;

   %calculo matriz de autocorrelacion
   M=20; %muestras para calcular autocorrelacion
   ro = corr(N+1:N+M); %autocorrelacion de 0 a M-1. desde N porque es donde esta el 0 de la autocorr
   y = corr(N+2:N+M+1); %autocorrelacion de 1 a M
   R = toeplitz(ro); %matriz de autocorrelacion
   B = inv(R)*y; %R*B=y  ----> B=Rinv*y
   
   %calculo filtro
   if(zi==0)
    zi = zeros(1,max(length(1),length([0 B']))-1.); %para la primera cond inicial
   end
   [s_filt, zf] = filter([0 B'],1,audio,zi); %filtro directo
   error = audio - s_filt;
   
   
   %calculo rta en frec
   S = fft(audio);
   G = sqrt(ro(1)-B'*y); %calculo ganancia
   S_aprox = freqz(G,[1 -B'],N,'whole'); %evalua en el circulo unitario para obtener H=G/(1-b1*z^-1......)
end
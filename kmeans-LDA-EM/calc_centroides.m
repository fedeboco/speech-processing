function [muK, xF1, xF2] = calc_centroides(phi, K, muestras_entrenam, media_gral)

    xF1 = zeros(1,K);   %formante1
    xF2 = zeros(1,K);   %formante2
    r = zeros(1,K);     %contador por columna
    for i=1:length(muestras_entrenam)
        found = 0; %encontró a qué rango angular pertenece?
        phi_x = angle(complex(muestras_entrenam(i,1)-media_gral(1),muestras_entrenam(i,2)-media_gral(2)));
        phi_x(phi_x<0) = phi_x(phi_x<0) + 2*pi; % paso a 0~2pi
        for j=1:K
            if( phi_x < phi(j) && found ==0 )
                r(j) = r(j)+1;
                xF1(r(j), j) = muestras_entrenam(i,1);
                xF2(r(j), j) = muestras_entrenam(i,2);
                found = 1;
            end
        end 
        if( found == 0 ) %si no los encontró, es el primer rango
                r(1) = r(1)+1;
                xF1(r(1), 1) = muestras_entrenam(i,1);
                xF2(r(1), 1) = muestras_entrenam(i,2);
        end
    end    

    %calculo centroides
    mu_aK1 = xF1(:, 1);                     %coord x
    mu_aK1 = mu_aK1(mu_aK1 ~= 0);           %filtro ceros
    mu_aK1 = sum(mu_aK1)/length(mu_aK1);    %media coordx
    mu_aK2 = xF2(:, 1);                     %coord y
    mu_aK2 = mu_aK2(mu_aK2 ~= 0);           %filtro ceros
    mu_aK2 = sum(mu_aK2)/length(mu_aK2);    %media coordy
    
    mu_oK1 = xF1(:, 2);
    mu_oK1 = mu_oK1(mu_oK1 ~= 0);
    mu_oK1 = sum(mu_oK1)/length(mu_oK1);
    mu_oK2 = xF2(:, 2);
    mu_oK2 = mu_oK2(mu_oK2 ~= 0);
    mu_oK2 = sum(mu_oK2)/length(mu_oK2);
    
    mu_uK1 = xF1(:, 3);
    mu_uK1 = mu_uK1(mu_uK1 ~= 0);
    mu_uK1 = sum(mu_uK1)/length(mu_uK1);
    mu_uK2 = xF2(:, 3);
    mu_uK2 = mu_uK2(mu_uK2 ~= 0);
    mu_uK2 = sum(mu_uK2)/length(mu_uK2);

    muK = [mu_aK1 mu_aK2; mu_oK1 mu_oK2; mu_uK1 mu_uK2];

end
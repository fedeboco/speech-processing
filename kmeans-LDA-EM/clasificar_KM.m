function [a_KM, o_KM, u_KM] = clasificar_KM(data, muK, K)
        
        N = length(data);
        datos_clasif = zeros(N,2,K);
        
        %Busco distancia mínima
        for i=1:N
            z(i)=0;
            dist_min = inf;
            for j=1:K
                %si la dist. a la media j-ésima es la mínima, es clase j.
                distancia = (data(i,:)-muK(j,:))*(data(i,:)-muK(j,:))' ;
                if(distancia < dist_min)
                    z(i) = j;
                    dist_min = distancia;
                end
            end
        end
        
        %Clasifico
        r = zeros(1,K); %contador por clase 
        for i=1:N
            if(z(i) == 1)
                r(z(i)) = r(z(i)) + 1;
                a_KM(r(1),:) = data(i,:);
            end
            if(z(i) == 2)
                r(z(i)) = r(z(i)) + 1;
                o_KM(r(2),:) = data(i,:);
            end
            if(z(i) == 3)
                r(z(i)) = r(z(i)) + 1;
                u_KM(r(3),:) = data(i,:);
            end
        end
end
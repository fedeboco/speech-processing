function [D, muK, z, a_KM, o_KM, u_KM, iteraciones_KM] = kmeans_fiubense(KM, muK,nombre)
    N = length(KM); %Numero de muestras de training
    K = length(muK); %Numero de clases
    
    D = inf;
    iteraciones = 11; %poner minimo 9
    figure('Name',nombre,'units','normalized','outerposition',[0.05 0.05 0.95 0.95])  
    mu_acum = zeros(3,2,iteraciones);
    clear iteraciones_KM
    for t=1:iteraciones
                
        %Calculo distancias
        for i=1:N
            z(i)=0;
            dist_min = inf;
            for j=1:K
                %si la dist. a la media j-ésima es la mínima, es clase j.
                distancia = (KM(i,:)-muK(j,:))*(KM(i,:)-muK(j,:))' ;
                if(distancia < dist_min)
                    z(i) = j;
                    dist_min = distancia;
                end
            end
        end
        
        %Actualizo media y distorsión
        for j=1:K
            
            %Actualizo media
            mu_num(j,:) = [0 0]; mu_den(j) = 0;
            for i=1:N
                if(z(i) == j)
                    mu_num(j,:) = mu_num(j,:) + KM(i,:);
                    mu_den(j) = mu_den(j) + 1;
                end
            end
            muK(j,:) = mu_num(j,:)/mu_den(j);

            [a_KM, o_KM, u_KM] = clasificar_KM(KM, muK, K);
            
            %Actualizo distorsión
            D = [0 0 0];
            for i=1:length(a_KM)
                D(1) = D(1) + sqrt( (a_KM(i,:)-muK(1,:))*(a_KM(i,:)-muK(1,:))' );
            end
            for i=1:length(o_KM)
                D(2) = D(2) + sqrt( (o_KM(i,:)-muK(2,:))*(o_KM(i,:)-muK(2,:))' );
            end
            for i=1:length(u_KM)
                D(3) = D(3) + sqrt( (u_KM(i,:)-muK(3,:))*(u_KM(i,:)-muK(3,:))' );
            end
            
        end
        D = sum(D)/K;
        
        %Reclasifico
        r = zeros(1,K); %contador por clase 
        for i=1:N
            if(z(i) == 1)
                r(z(i)) = r(z(i)) + 1;
                a_KM(r(1),:) = KM(i,:);
            end
            if(z(i) == 2)
                r(z(i)) = r(z(i)) + 1;
                o_KM(r(2),:) = KM(i,:);
            end
            if(z(i) == 3)
                r(z(i)) = r(z(i)) + 1;
                u_KM(r(3),:) = KM(i,:);
            end
        end
        
        %Guardo para animación
        iteraciones_KM(t).mu = muK;
        iteraciones_KM(t).a = a_KM;
        iteraciones_KM(t).o = o_KM;
        iteraciones_KM(t).u = u_KM;
        iteraciones_KM(t).D = D;

        %Ploteo cada iteración y medias anteriores
        if( t<=9 )
            subplot(3,3,t)
            plotear_resultado_kmeans(a_KM, o_KM, u_KM, muK)
            hold on
            if(t>1)
                for i=1:t-1
                    scatter(mu_acum(1,1,i),mu_acum(1,2,i),'k','.')
                    scatter(mu_acum(2,1,i),mu_acum(2,2,i),'k','.')
                    scatter(mu_acum(3,1,i),mu_acum(3,2,i),'k','.')
                end
            end
            hold off
            text(300,1550,['D = ',num2str(D)], 'fontsize', 9)
            title(['Iteración ',num2str(t)], 'fontsize', 9)   
        end
        mu_acum(:,:,t) = muK;
        
        
    end
    
    iteraciones_KM(t).mu_acum = mu_acum;
    
end    
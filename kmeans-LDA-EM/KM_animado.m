function void = KM_animado(iteraciones1, iteraciones2)
    figure('Name','Training en K-Means','units','normalized','outerposition',[0.2 0.3 0.7 0.6])  
    j = 1;
    while( j <= length(iteraciones1)+1 )
        clf
        subplot(1,2,1)
  
        plotear_resultado_kmeans(iteraciones1(j).a, iteraciones1(j).o, iteraciones1(j).u, iteraciones1(j).mu)
        hold on
        mu_acum1(:,:,j) = iteraciones1(j).mu;
        if(j>1)
            for i=1:j-1
                scatter(mu_acum1(1,1,i),mu_acum1(1,2,i),'k','.')
                scatter(mu_acum1(2,1,i),mu_acum1(2,2,i),'k','.')
                scatter(mu_acum1(3,1,i),mu_acum1(3,2,i),'k','.')
            end
        end
        hold off
        text(250,1500,['D = ',num2str(iteraciones1(j).D)], 'fontsize', 20)
        title(['Bootstrap: Iteración ',num2str(j)], 'fontsize', 15)   
        box on
        grid on
        hold on
        
        
        subplot(1,2,2)
        plotear_resultado_kmeans(iteraciones2(j).a, iteraciones2(j).o, iteraciones2(j).u, iteraciones2(j).mu)
        hold on
        mu_acum2(:,:,j) = iteraciones2(j).mu;   
        if(j>1)
            for i=1:j-1
                scatter(mu_acum2(1,1,i),mu_acum2(1,2,i),'k','.')
                scatter(mu_acum2(2,1,i),mu_acum2(2,2,i),'k','.')
                scatter(mu_acum2(3,1,i),mu_acum2(3,2,i),'k','.')
            end
        end
        hold off
        text(250,1500,['D = ',num2str(iteraciones2(j).D)], 'fontsize', 20)
        title(['Aleatorio: Iteración ',num2str(j)], 'fontsize', 15)   

        box on
        grid on
        drawnow
        hold on
        
        
        pause(0.8)
        j = j + 1;       
        if( j == length(iteraciones1)+1 )
            j = 1;
        end
    end
end
function void = EM_animado(iteraciones1, iteraciones2)
    figure('Name','Training en EM','units','normalized','outerposition',[0.2 0.3 0.7 0.6])  
    j = 1;
    while( j <= length(iteraciones1)+1 )
        clf
        subplot(1,2,1)
        scatter(iteraciones1(1).data_E(:,1),iteraciones1(1).data_E(:,2),[],iteraciones1(j).gamma(:,:))
        hold on

        scatter(iteraciones1(j).mu(1,1), iteraciones1(j).mu(1,2), 'linewidth', 4)
        scatter(iteraciones1(j).mu(2,1), iteraciones1(j).mu(2,2), 'linewidth', 4)
        scatter(iteraciones1(j).mu(3,1), iteraciones1(j).mu(3,2), 'linewidth', 4)
        mu_acum1(:,:,j) = iteraciones1(j).mu;
        if(j>1)
            for i=1:j-1
                scatter(mu_acum1(1,1,i),mu_acum1(1,2,i),'k','.')
                scatter(mu_acum1(2,1,i),mu_acum1(2,2,i),'k','.')
                scatter(mu_acum1(3,1,i),mu_acum1(3,2,i),'k','.')
            end
        end
        title(['Bootstrap: Iteración ',num2str(j)], 'fontsize', 15)
        xlabel('Formante 1 [Hz]')
        ylabel('Formante 2 [Hz]')
        box on
        grid on
        text(250,1500,['LL = ',num2str(iteraciones1(j).LL)], 'fontsize', 20)       
        hold on
        
        subplot(1,2,2)
        scatter(iteraciones2(1).data_E(:,1),iteraciones2(1).data_E(:,2),[],iteraciones2(j).gamma(:,:))
        hold on

        scatter(iteraciones2(j).mu(1,1), iteraciones2(j).mu(1,2), 'linewidth', 4)
        scatter(iteraciones2(j).mu(2,1), iteraciones2(j).mu(2,2), 'linewidth', 4)
        scatter(iteraciones2(j).mu(3,1), iteraciones2(j).mu(3,2), 'linewidth', 4)
        mu_acum2(:,:,j) = iteraciones2(j).mu;
        if(j>1)
            for i=1:j-1
                scatter(mu_acum2(1,1,i),mu_acum2(1,2,i),'k','.')
                scatter(mu_acum2(2,1,i),mu_acum2(2,2,i),'k','.')
                scatter(mu_acum2(3,1,i),mu_acum2(3,2,i),'k','.')
            end
        end
        title(['Aleatorio: Iteración ',num2str(j)], 'fontsize', 15)
        xlabel('Formante 1 [Hz]')
        ylabel('Formante 2 [Hz]')
        box on
        grid on
        text(250,1500,['LL = ',num2str(iteraciones2(j).LL)], 'fontsize', 20)       
        hold on

        
        
        
        pause(0.02)
        j = j + 1;       
        if( j == length(iteraciones1)+1 )
            j = 1;
        end
    end
end
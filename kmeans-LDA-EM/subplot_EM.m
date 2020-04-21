function void = subplot_EM(i, data_E, gamma, mu, LL, mu_acum)

    subplot(2,5,i)
    scatter(data_E(:,1),data_E(:,2),[],gamma(:,:))
    hold on

    scatter(mu(1,1), mu(1,2), 'linewidth', 4)
    scatter(mu(2,1), mu(2,2), 'linewidth', 4)
    scatter(mu(3,1), mu(3,2), 'linewidth', 4)
    if(i>1)
        for j=1:i-1
            scatter(mu_acum(1,1,j),mu_acum(1,2,j),'k','.')
            scatter(mu_acum(2,1,j),mu_acum(2,2,j),'k','.')
            scatter(mu_acum(3,1,j),mu_acum(3,2,j),'k','.')
        end
    end
    title(['Iteración ',num2str(i)], 'fontsize', 9)
    xlabel('Formante 1 [Hz]')
    ylabel('Formante 2 [Hz]')
    grid on

    text(300,1550,['LL = ',num2str(LL)], 'fontsize', 9)


end
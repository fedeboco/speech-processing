function void = plotear_resultado_kmeans(a_KM, o_KM, u_KM, muK)

    hold on
    scatter(a_KM(:,1), a_KM(:,2))
    scatter(o_KM(:,1), o_KM(:,2))
    scatter(u_KM(:,1), u_KM(:,2))
    scatter(muK(1,1), muK(1,2), 'linewidth', 4)
    scatter(muK(2,1), muK(2,2), 'linewidth', 4)
    scatter(muK(3,1), muK(3,2), 'linewidth', 4)
    hold off
    grid
    xlabel('Formante 1 [Hz]')
    ylabel('Formante 2 [Hz]')
    
%     legend('Clase 1','Clase 2','Clase 3','location','southeast')
    
end
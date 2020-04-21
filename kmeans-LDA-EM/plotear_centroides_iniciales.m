function void = plotear_centroides_iniciales(muK, xF1, xF2, phi, media_gral)
    %ploteo rectas de clases iniciales
    plot_ang = linspace(0,10000,10000);
    u1polar = plot_ang*cos(phi(1))+media_gral(1);
    v1polar = plot_ang*sin(phi(1))+media_gral(2);
    u2polar = plot_ang*cos(phi(2))+media_gral(1);
    v2polar = plot_ang*sin(phi(2))+media_gral(2);
    u3polar = plot_ang*cos(phi(3))+media_gral(1);
    v3polar = plot_ang*sin(phi(3))+media_gral(2);

    subplot(1,3,2)
    hold on
    scatter(xF1(:,1),xF2(:,1)) %ploteo valores clasificados iniciales
    scatter(xF1(:,2),xF2(:,2))
    scatter(xF1(:,3),xF2(:,3))
    scatter(media_gral(1), media_gral(2)) %ploteo media gral
    plot(u1polar,v1polar) %ploteo rectas
    plot(u2polar,v2polar)
    plot(u3polar,v3polar)
    hold off
    axis([200 1000 600 1600])
    grid
    xlabel('Formante 1 [Hz]')
    ylabel('Formante 2 [Hz]')
    legend('Clase 1','Clase 2','Clase 3','location','southeast')
end
function void = plot_test_KM(a_KM_test, o_KM_test, u_KM_test, a_test, o_test, u_test, muK, X, Y, Za, Zo, Zu)
    hold on
    %Valores clasificados
    scatter(a_KM_test(:,1),a_KM_test(:,2),'r')
    scatter(o_KM_test(:,1),o_KM_test(:,2),'b')
    scatter(u_KM_test(:,1),u_KM_test(:,2),'g')
    %Valores verdaderos
    scatter(a_test(:,1),a_test(:,2),'.','r')
    scatter(o_test(:,1),o_test(:,2),'.','b')
    scatter(u_test(:,1),u_test(:,2),'.','g')
    %Medias
    scatter(muK(1,1), muK(1,2), 'r', 'linewidth', 4)
    scatter(muK(2,1), muK(2,2), 'b', 'linewidth', 4)
    scatter(muK(3,1), muK(3,2), 'g', 'linewidth', 4)
    %Curvas de nivel   
    contour(X,Y,Za,'r');
    contour(X,Y,Zo,'b');
    contour(X,Y,Zu,'g');
    hold off
    
    legend('Clase 1','Clase 2','Clase 3','a real','o real','u real','location','southeast')
    grid on; box on
    xlabel('Formante 1 [Hz]')
    ylabel('Formante 2 [Hz]')
    
end
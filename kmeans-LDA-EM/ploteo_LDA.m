function void = ploteo_LDA(a,o,u,mu_a,mu_o,mu_u,X,Y,Za,Zo,Zu,x1,x2,x3,A,O,U,a_test,o_test,u_test,gA,gO,gU)
    
    %Ploteo muestras y curvas de nivel
    figure('units','normalized','outerposition',[0.1 0.4 0.85 0.5])
    subplot(1,3,1)
    hold on
    scatter(a(:,1),a(:,2),[],'c')
    scatter(o(:,1),o(:,2),[],'m')
    scatter(u(:,1),u(:,2),[],'r')
    scatter(mu_a(1),mu_a(2), 'linewidth', 4)
    scatter(mu_o(1),mu_o(2), 'linewidth', 4)
    scatter(mu_u(1),mu_u(2), 'linewidth', 4)
    title('LDA - Distribución de formantes en entrenamiento')
    xlabel('Formante 1 [Hz]')
    ylabel('Formante 2 [Hz]')
    contour(X,Y,Za,'c');
    contour(X,Y,Zo,'m');
    contour(X,Y,Zu,'r');
    %ploteo rectas de separación
    plot(x1,x2,'k','linestyle','--')
    plot(x1,x3,'k','linestyle','--')
    hold off
    legend('a','o','u','Location','Southeast')
    grid
    axis([200 1100 600 1600])
    box on

    subplot(1,3,2)
    hold on
    %ploteo clasificacion
    scatter(A(:,1),A(:,2),'r')
    scatter(O(:,1),O(:,2),'b')
    scatter(U(:,1),U(:,2),'g')
    %ploteo valores verdaderos
    scatter(a_test(:,1),a_test(:,2),'.','r')
    scatter(o_test(:,1),o_test(:,2),'.','b')
    scatter(u_test(:,1),u_test(:,2),'.','g')
    %ploteo medias
    scatter(mu_a(1),mu_a(2), 'linewidth', 4)
    scatter(mu_o(1),mu_o(2), 'linewidth', 4)
    scatter(mu_u(1),mu_u(2), 'linewidth', 4)
    %ploteo rectas de separación
    plot(x1,x2,'k','linestyle','--')
    plot(x1,x3,'k','linestyle','--')
    grid
    title('LDA - Testing')
    xlabel('Formante 1 [Hz]')
    ylabel('Formante 2 [Hz]')
    legend('a LDA','o LDA','u LDA','a real','o real','u real','Location','Southeast')
    hold off
    axis([200 1100 600 1600])
    box on

    subplot(1,3,3)
    grid
    hold on
    stem(gA)
    stem(gO)
    stem(gU)
    title('LDA - Evaluación del discriminante')
    xlabel('Muestra de Testing')
    ylabel('g_k')
    legend('g_a','g_o','g_u')
    hold off
    box on
end
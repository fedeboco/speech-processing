function [gA, gO, gU] = calc_discriminante_EM(a, o ,u, test, mu_a, mu_o, mu_u, sigma)

    len_tot = length(a)+length(o)+length(u);

    piA = length(a)/len_tot;
    piO = length(o)/len_tot;
    piU = length(u)/len_tot;

    test_centrado_a(:,1) = test(:,1) - mu_a(:,1);
    test_centrado_a(:,2) = test(:,2) - mu_a(:,2);
    test_centrado_o(:,1) = test(:,1) - mu_o(:,1);
    test_centrado_o(:,2) = test(:,2) - mu_o(:,2);
    test_centrado_u(:,1) = test(:,1) - mu_u(:,1);
    test_centrado_u(:,2) = test(:,2) - mu_u(:,2);
       
    for i = 1:length(test)
        alfa_a(i,:) = test_centrado_a(i,:)*inv(sigma(:,:,1))*test_centrado_a(i,:)';
        alfa_o(i,:) = test_centrado_o(i,:)*inv(sigma(:,:,2))*test_centrado_o(i,:)';
        alfa_u(i,:) = test_centrado_u(i,:)*inv(sigma(:,:,3))*test_centrado_u(i,:)';
    end
    
    %Testeo con las 30 muestras de test
    gA = -alfa_a/2 -log(det(sigma(:,:,1)))/2 + log(piA);
    gO = -alfa_o/2 -log(det(sigma(:,:,2)))/2 + log(piO);
    gU = -alfa_u/2 -log(det(sigma(:,:,3)))/2 + log(piU);
    
end
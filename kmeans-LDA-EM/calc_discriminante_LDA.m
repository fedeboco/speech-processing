function [gA, gO, gU, x1, x2, x3] = calc_discriminante_LDA(a, o ,u, test, mu_a, mu_o, mu_u, sigma)

    len_tot = length(a)+length(o)+length(u);

    piA = length(a)/len_tot;
    piO = length(o)/len_tot;
    piU = length(u)/len_tot;

    xoA = mu_a*inv(sigma)*mu_a';
    VoA = inv(sigma)*mu_a';

    xoO = mu_o*inv(sigma)*mu_o';
    VoO = inv(sigma)*mu_o';

    xoU = mu_u*inv(sigma)*mu_u';
    VoU = inv(sigma)*mu_u';

    %Testeo con las 30 muestras de test

    gA = -xoA/2 + VoA'*test' + log(piA);
    gO = -xoO/2 + VoO'*test' + log(piO);
    gU = -xoU/2 + VoU'*test' + log(piU);
    
    %Calculo rectas de separación
    x1 = linspace(200, 1100, 100);
    %salen de igualar gA = gO y gO = gU
    x2 = ( -xoA/2+log(piA)+xoO/2-log(piO)-x1*(-VoA(1)+VoO(1)) )/((-VoA(2)+VoO(2)));
    x3 = ( -xoO/2+log(piO)+xoU/2-log(piU)-x1*(-VoO(1)+VoU(1)) )/((-VoO(2)+VoU(2)));
    
end
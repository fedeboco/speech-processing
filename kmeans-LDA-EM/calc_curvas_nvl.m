function [X, Y, Za, Zo, Zu] = calc_curvas_nvl(mu_a, mu_o, mu_u, sigma)

    x = linspace(200, 1100, 80);
    y = linspace(600, 1600, 80);
    [X, Y] = meshgrid(x, y); %Armo plano cartesiano
    Za = mvnpdf([X(:) Y(:)], mu_a, sigma); %10000x1 evaluo densidad gaussiana
    Zo = mvnpdf([X(:) Y(:)], mu_o, sigma);
    Zu = mvnpdf([X(:) Y(:)], mu_u, sigma);
    Za = reshape(Za,length(y), length(x)); %100x100
    Zo = reshape(Zo,length(y), length(x));
    Zu = reshape(Zu,length(y), length(x));
    
end
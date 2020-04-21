function phi = calc_angulos(K)
    phi_i = rand*2*pi; %angulo aleatorio inicial
    phi = size(1,K);
    for i=1:K
        phi(i) = phi_i + 2*pi/K*(i-1); %K angulos
        if(phi(i) >= 2*pi)
            phi(i) = phi(i) - 2*pi; %entre 0 y 2pi
        end
    end
    phi = sort(phi); %ordeno de menor a mayor para el algoritmo
end
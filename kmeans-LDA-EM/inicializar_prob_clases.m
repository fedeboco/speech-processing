function p = inicializar_prob_clases(K)
    %asume equiprobabilidad
    p = zeros(1,K);
    for i=1:K
        p(i) = 1/K;
    end
end
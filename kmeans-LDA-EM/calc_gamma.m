function gamma = calc_gamma(K, mu, sigma, p_clase, data_E)
    N = length(data_E);
    gamma = zeros(N,K);
    p_norm = zeros(N,K);
    for k=1:K
      p_norm(:,k) = calc_prob(data_E, mu(k,:), sigma(:,:,k));
    end
    den_gamma = (p_clase*p_norm')';
    for i=1:N
        for k=1:K
             gamma(i,k) = p_clase(k)*p_norm(i,k)/den_gamma(i);
        end
    end
end
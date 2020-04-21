function LL = calc_loglikelihood(data_E, mu, sigma, K, N, p_clase)

    LL = 0;
    for n=1:N
        L(n) = 0;
        for k=1:K
            L(n) = L(n) + calc_prob(data_E(n,:),mu(k,:),sigma(:,:,k))*p_clase(k); %likelihood
        end
        LL = LL + log(L(n));
    end
end
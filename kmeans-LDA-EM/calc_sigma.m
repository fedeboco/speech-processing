function sigma = calc_sigma(data_E, gamma, mu)
    K = length(gamma(1,:));
    N = length(data_E);
    vars = length(data_E(1,:));
    sigma = zeros(vars, vars, K);
    data_E_cent = zeros(N,vars);
       
    for k=1:K
               
        for l=1:vars %valor centrado
            data_E_cent(:,l) = data_E(:,l) - mu(k,l);
        end
        sigma(:,:,k) = (data_E_cent)'*diag(gamma(:,k))*(data_E_cent)/sum(gamma(:,k));
    end
end
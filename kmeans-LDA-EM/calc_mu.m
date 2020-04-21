function mu = calc_mu(data_E, gamma)
    K = length(gamma(1,:));
    denom = zeros(1,K);
    for i=1:K
       denom(i) = sum(gamma(:,i));
    end
    mu = gamma'*data_E;
    for i=1:K
        mu(i,:) = mu(i,:)./denom(i);
    end
end
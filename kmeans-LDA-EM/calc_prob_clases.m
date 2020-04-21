function p_clase = calc_prob_clases(data_E, gamma)
    N = length(data_E); 
    K = length(gamma(1,:));
    p_clase = zeros(1,K);
    for i=1:K
        p_clase(i) = sum(gamma(:,i))/N;
    end  
end
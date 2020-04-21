function prob_norm = calc_prob(data_E, mu, sigma)
    N = length(data_E(:,1));
    prob_norm = zeros(N,1);
    for i=1:N
            %calculo la prob de que un dato pertenezca a la clase
            prob_norm(i) = mvnpdf((data_E(i,:)),mu,sigma);
    end
end
function sigma = estimar_sigma_LDA(a,o,u,mu_a,mu_o,mu_u)
    
    sigma_a = calc_covariance(a,mu_a);
    sigma_o = calc_covariance(o,mu_o);
    sigma_u = calc_covariance(u,mu_u);

    N = length(a) + length(o) + length(u);

    Na = length(a);
    No = length(o);
    Nu = length(u);

    sigma = (Na*sigma_a + No*sigma_o + Nu*sigma_u)/N;
    
end    
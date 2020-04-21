function sigma = calc_sigma_kmeans(a_KM,o_KM,u_KM,muK)
    sigma(:,:,1) = calc_covariance(a_KM,muK(1,:));
    sigma(:,:,2) = calc_covariance(o_KM,muK(2,:));
    sigma(:,:,3) = calc_covariance(u_KM,muK(3,:));
end
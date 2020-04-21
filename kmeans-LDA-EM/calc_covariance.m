function cov = calc_covariance(x, mu_x)
    %se asume x como conjunto de muestras de una VA distinta por columna.
    cov_rows = length(x(1,:)); %deduce la cant de vars aleatorias
    cov_cols = cov_rows;  %la matriz de cov es cuadrada
    
    cov = zeros(cov_rows, cov_cols);
    %j recorre la fila y k la columna
    for j=1:cov_rows
        for k=1:cov_cols
            for i=1:length(x)
                cov(j,k) = cov(j,k) + (x(i,j)-mu_x(j))*(x(i,k)-mu_x(k));
            end
        end
    end
    cov = cov./length(x);
end
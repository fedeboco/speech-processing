function [mu_a, mu_o, mu_u] = estimar_medias_LDA(a,o,u)
    mu_a = sum(a)/length(a);
    mu_o = sum(o)/length(o);
    mu_u = sum(u)/length(u);
end    
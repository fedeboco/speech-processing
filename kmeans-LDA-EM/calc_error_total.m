%Esta función calcula el error que suman las 3 clases. 
%x1, x2 y x3 son los valores reales.
function error = calc_error_total(x1, x2, x3, y1, y2, y3)

    Nx1 = length(x1);
    Nx2 = length(x2);
    Nx3 = length(x3);
    N = Nx1 + Nx2 + Nx3;

    Ne1 = calc_erroneos(x1, y1);
    Ne2 = calc_erroneos(x2, y2);
    Ne3 = calc_erroneos(x3, y3);
    
    error = (Ne1 + Ne2 + Ne3)/N*100;
        
end
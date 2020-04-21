%Esta función toma los valores verdaderos x y los compara con cada valor
%de y. Si no lo encuentra, quiere decir que hay un error. Luego con la
%cantidad de erroneos calcula el error.

function Ne = calc_erroneos(x, y)

    Nx = length(x);
    Ny = length(y);
    
    Ne = 0; %numero de erroneos
        
    for i=1:Nx
        found = 0;
        for j=1:Ny
            if( x(i,:) == y(j,:) )
                found = 1;
            end
        end
        if( found == 0)
            Ne = Ne + 1;
        end
    end
    
end
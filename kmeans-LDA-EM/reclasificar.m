function [y1, y2, y3, muo, sigmao] = reclasificar(x1, x2, x3, y1, y2, y3, mui, sigmai)
    
    clear y;

    %el length es porque los vectores tienen dist. longitudes
    y(1:length(y1),:,1) = y1; 
    y(1:length(y2),:,2) = y2;
    y(1:length(y3),:,3) = y3;

    v = [1 2 3];
    v = perms(v); %permutaciones posibles de clases

    error_min = inf;
    %calculo el error total para todas las permutaciones posibles
    for i=1:length(v)
        error = calc_error_total(x1, x2, x3, y(:,:,v(i,1)), y(:,:,v(i,2)), y(:,:,v(i,3)));
        if(error < error_min)
            error_min = error; %el que minimice el error define las clases
            clases = v(i,:);
        end
    end

    %Reasigno
    y1 = y(:,:,clases(1));
    y2 = y(:,:,clases(2));
    y3 = y(:,:,clases(3));
    %Filtro de ceros
    y1( ~any(y1,2), :) = [];
    y2( ~any(y2,2), :) = [];
    y3( ~any(y3,2), :) = [];
    %Reasigno medias
    muo(1,:) = mui(clases(1),:);
    muo(2,:) = mui(clases(2),:);
    muo(3,:) = mui(clases(3),:);
    %Reasigno sigmas
    sigmao(:,:,1) = sigmai(:,:,clases(1));
    sigmao(:,:,2) = sigmai(:,:,clases(2));
    sigmao(:,:,3) = sigmai(:,:,clases(3));
    
end
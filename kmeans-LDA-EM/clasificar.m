function [A, O, U] = clasificar(test, gA, gO, gU)
    ja=0;
    jo=0;
    ju=0;
    
    for i=1:length(gA)
        if(gA(i)>gO(i) && gA(i)>gU(i))
            ja = ja+1;
            A(ja,:) = test(i,:);
        end
        if(gO(i)>gA(i) && gO(i)>gU(i))
            jo = jo+1;
            O(jo,:) = test(i,:);
        end
        if(gU(i)>gA(i) && gU(i)>gO(i))
            ju = ju+1;
            U(ju,:) = test(i,:);
        end 
    end
end
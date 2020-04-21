%% LDA linear discriminant analysis

%1) Tenemos 3 clases
%2) Estimamos una sola sigma para la gaussiana en maximum 
%likelyhood porque de otra forma las dimensiones de las matrices se hacen
%enormes. Hacer el sigma de cada una de las clases y promediarla con p(w).
%3) Estimamos una media para cada clase

%Tengo que buscar P(w|x)=p(x|w)P(w)/p(x) donde p(x|w) es la densidad de prob.
%p(x)=sum_{i=1}^3{p(x|w)p(w)} y donde P(w|x) es la probabilidad de decision
%de la clase dado el x que quiero clasificar.

%El archivo de texto tiene las muestras de los picos de las formantes
%a.txt tiene en filas a1, a2, a3 con F1, F2 y F3 en cada columna donde ai
%es cada muestra de la vocal a.

%Usamos 40 de cada clase para entrenar y 10 para testing
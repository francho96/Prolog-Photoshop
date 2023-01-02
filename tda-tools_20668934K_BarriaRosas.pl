% ------------- Funciones auxiliares -------------
% Insertsort
% Dominio: Lista
% Recorrido: Lista ordenada
% Permite ordenar una lista con el algoritmo insert
insertsort(List,Sorted):-
    isort(List,[],Sorted).

isort([],Acc,Acc).
isort([H|T],Acc,Sorted):-insert(H,Acc,NAcc),isort(T,NAcc,Sorted).
   
insert(X,[Y|T],[Y|NT]):-X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).



% Funciones lógicas para saber si un elemento dado está o no en una lista:

miembro(E, L) :- L=[X|Y], X=E.
miembro(E, L) :- L=[X|Y], miembro(E, Y).

miembro(E, [X|Y]) :- X=E.
miembro(E, [X|Y]) :- miembro(E, Y).

miembro(X,[X|Y]).
miembro(E,[X|Y]) :- miembro(E, Y).

miembro(X, [X|_]).
miembro(X, [_|Y]) :- miembro(X, Y).



% esLista(Lista) : Lista es una lista
esLista([]).
esLista([_|_]).

% nel(Lista, N) : el número de elementos de la lista Lista es N
nel([], 0).
nel([X|Y], N) :- nel(Y, M), N is M+1.

%insertar(Elem, L1, L2) : se inserta el elemento Elem en la lista L1, obteniéndose así la lista L2
insertar(E, L, [E|L]).
insertar(E, [X|], [X|Z]) :- insertar(E, Y, Z).

% borrar(Elem, L1, L2) : se borra el elemento Elem de la lista L1, obteniéndose así la lista L2
borar(X, [X|Y], Y).
borrar(X, [Z|L], [Z|M]) :- borrar(X, L, M).

% ultimo(Elem, Lista) : Elem es el último elemento de la lista Lista
ultimo(X, [X]).
ultimo(X, [_|Y]) :- ultimo(X, Y).

% subconjunto(L1, L2) : la lista L1 es un subconjunto de la lista L2
suconjunto([], Y).
subconjunto([X|Y], Z) :- miembro(X, Z), subconjunto(Y, Z).

% concatena(A, B, C) : concatenación de las listas A y B dando lugar a la lista C
concatena(A, B, C) :- A=[], C=B.
concatena(A, B, C) :- A=[X|D], concatena(D, B, E), C=[X|E].

concatena([], L, L).
concatena([X|A], B, [X|C]) :- concatena(A, B, C).

% inversa(Lista, Inver) : Inver es la inversa de la lista Lista
inversa([], []).
inversa([X|Y], L) :- inversa(Y, Z), concatena(Z, [X], L).

% permutacion(L1, L2) : la lista L2 es una permutación de la lista L1
permutacion([], []).
permutacion([X|Y], Z) :- permutacion(Y, L), insertar(X, L, Z).

% 1. Máximo de dos números.
maximo(X, Y, X) :- X >= Y.
maximo(X, Y, Y) :- Y > X.


% 2. Factorial de un número.
factorial(0, 1).
factorial(X, Y) :- X > 0, X1 is X-1, factorial(X1, Y1), Y is X*Y1.


% 3. Una función que determine si todos los elementos de una lista son menores que cierto valor dado.
lista_acotada([], _).
lista_acotada([X|L], N) :- X < N, lista_acotada(L, N).


% 4. Máximo de una lista de números.
max_lista([X], X).
max_lista([X1, X2|L], Y) :- maximo(X1, X2, X3), max_lista([X3|L], Y).


% 5. Suma de los valores de una lista.
suma([], 0).
suma([X|L], Y):- suma(L, Y1), Y is X+Y1.


% 6. Una función que determine si una lista está ordenada crecientemente o no.
ordenada_crec([_]).
ordenada_crec([X, Y|L]) :- X =< Y, ordenada_crec([Y|L]).

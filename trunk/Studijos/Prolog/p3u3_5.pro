% Karolis Uosis
%  Programu sistemos, 4 kursas 3 grupe
%  MIF, 2009
%  3 praktinis darbas 3.5 užduotis

pirmieji(X, 0, []).
pirmieji([X|Y], 1, [X|[]]).
pirmieji([X|Y], K, [X|T]) :- pirmieji(Y, K - 1, T).
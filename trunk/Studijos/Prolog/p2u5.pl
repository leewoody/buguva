% Karolis Uosis
%  Programu sistemos, 4 kursas 3 grupe
%  MIF, 2009
%  2 praktinis darbas 5 užduotis 

fib(0, 0).
fib(1, 1).
fib(X, Y) :- X > 1, 
             X2 is X - 1,
             X3 is X - 2,
             fib(X2, M), 
             fib(X3, N), 
             Y is M + N.
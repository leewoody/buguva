% Karolis Uosis
%  Programu sistemos, 4 kursas 3 grupe
%  MIF, 2009
%  3 praktinis darbas 2.6 užduotis

divide(X, X, 1) :- X \= 0.
divide(X, Y, 0) :- Y \= 0, 
                   X < Y.
divide(X, Y, Z) :- Y \= 0, 
                   X > Y, 
                   X2 is X - Y,
                   divide(X2, Y, Z2), 
                   Z is Z2 + 1.
module(X, Y, Z) :- divide(X, Y, R), 
                   Z is X - (Y * R).

sum([X|[]], X, 0) :- module(X, 2, 0).
sum([X|[]], 0, X) :- module(X, 2, 1).
sum([X|T], R1, R2) :- T \= [],
                      module(X, 2, 0),
                      sum(T, R12, R22), 
                      R1 is R12 + X, 
                      R2 is R22.
sum([X|T], R1, R2) :- T \= [],
                      module(X, 2, 1),
                      sum(T, R12, R22), 
                      R1 is R12, 
                      R2 is R22 + X .
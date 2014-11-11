and(A,B) :- A, B.

or(A,_) :- A.
or(_,B) :- B.

impl(A,B) :- or(not(A),B).

bind(true).
bind(fail).

table(A,B,Expr) :- bind(A), bind(B), do(A,B,Expr), fail.

do(A,B,_) :- write(A), write('  '), write(B), write('  '), fail.
do(_,_,Expr) :- Expr, !, write(true), nl.
do(_,_,_) :- write(fail), nl.
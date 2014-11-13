/* Realiza o "E" da lógica proposicional, só vai ser verdadeiro se caso os dois parâmetro for verdade */
op_and(A,B) :- A, B.
/* Realiza o "OU" da lógica proposicional, só vai ser falso, se os dois parâmetros for falso */
op_or(A,_) :- A.
op_or(_,B) :- B.
/* Realiza o "Implica" da lógica proposicional, só vai ser FALSO, se caso a da esquerda for verdade e da direita falsa */
impl(A,B) :- op_or(not(A),B).
/* Realiza o "Equivalência" da lógica proposicional, só vai ser equivalente se as duas preprosições possuem a mesma tabela */
equ(A,B) :- op_or(op_and(A,B), op_and(not(A),not(B))).
/* Realiza o "Xor" da lógica proposicional */
op_xor(A,B) :- not(equ(A,B)).
/* Realiza a "Bi-Impicação" da lógica proposicional, só vai ser verdadeiro, se caso as duas for falso, ou verdadeiro */
bimp(A,B) :- not(op_xor(A,B)).

bind(true).
bind(fail).

table(A,B,Expr) :- bind(A), bind(B), do(A,B,Expr), fail.

do(A,B,_) :- write(A), write('  '), write(B), write('  '), fail.
do(_,_,Expr) :- Expr, !, write(true), nl.
do(_,_,_) :- write(fail), nl.


/* worked: table(A,B,op_and(A,op_or(A,B))). */
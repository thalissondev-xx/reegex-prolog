start :- 
	write('Enter expression: '), read(X), verify(X).

verify(X) :- 
	writef("%s", [X]),
	count(X).

count(X) :-
	writef("%s", ["Counting variables..."]).

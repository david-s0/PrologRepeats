:-consult(library(lists)).

%1
subList([], _).
subList([H|T], L) :-
	member(H, L),
	subList(T, L).

%2a
intersect_a(L1, L2, I) :-
	setof(E, (member(E, L1), member(E, L2)), I).
intersect_a(_, _, []).

%2b
%there might be a better solution to this one...
toAdd(E, I, L) :-
	member(E, L),
	E == I.
repetitions(I, L, N) :-
	findall(E, toAdd(E, I, L), All),
	length(All, N).
extract([], []).
extract([_/E|L], [E|L2]) :-
	extract(L, L2).
intersectb(L1, L2, I) :-
	intersect(L1, L2, I1),
	setof(C/E, (member(E, I1), repetitions(E, L2, C)), Set),
	extract(Set, I).

%3
disjoint(L1, L2) :-
	setof(E, (member(E, L1), member(E, L2)), []).

%4
difference(L1, L2, L) :-
	findall(E, (member(E, L1), \+member(E, L2)), L).

%5
sift(L, N, Result) :-
	findall(E, (member(E, L), E < N), Result).

%6
process(L1, L2, Consistent, Inconsistent) :-
	setof((Name, Number, More), (member((Name, Number), L1), member((Name, Number, More), L2)), Consistent),
	setof((Name2, Number2, More2), (member((Name2, Number2, More2), L2), \+member((Name2, Number2), L1)), Inconsistent).
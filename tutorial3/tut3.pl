%Q1
%mysort
mysort(L, SL) :-
	setof(E, member(E, L), SL).

%myrev
myrev([], []).
myrev([H|L], RL) :-
	myrev(L, RL2),
	append(RL2, [H], RL).

%followedBy
followedBy(X, Y, [X, Y|_]).
followedBy(X, Y, [_, H2|L]) :-
	followedBy(X, Y, [H2|L]).

%nextTo
nextTo(X, Y, L) :-
	followedBy(X, Y, L).
nextTo(X, Y, L) :-
	followedBy(Y, X, L).

%sumList
sumList([], 0).
sumList([H|L], S) :-
	sumList(L, S1),
	S is (S1 + H).

%Q2
%last
last([H|[]], H).
last([_|L], E) :-
	last(L, E).

%Q3
%a
edge(a, b).
edge(a, e).
edge(b, c).
edge(e, f).
edge(f, c).
edge(f, d).
edge(c, d).

%b
path(X, Y) :-
	edge(X, Y).
path(X, Y) :-
	edge(X, Z),
	path(Z, Y).

%c
path_c(X, Y, [X, Y]) :-
	edge(X, Y).
path_c(X, Y, [X|W]) :-
	edge(Z, Y),
	path_c(Z, Y, W).

%Q4
max(E, [E|[]]).
max(E, [H1, H2|T]) :-
	H1 =< H2,
	max(E, [H2|T]).
max(E, [H1, H2|T]) :-
	H1 > H2,
	max(E, [H1|T]).

%Q5
real_max_of_all(E, [], E).
real_max_of_all(E, [H|[]], E) :-
	max(Max, H),
	max(RealMax, [Max, E]),
	real_max_of_all(RealMax, [], E).
max_of_all(E, [H1, H2|Ls]) :-
	max(E1, H1),
	max(E2, H2),
	max(E3, [E1, E2]),
	real_max_of_all(E3, Ls, E).
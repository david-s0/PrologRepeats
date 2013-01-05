:-use_module(library(lists)).


% child_mother(C, M) means C is a child of mother M.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

child_mother(amy, mary).
child_mother(arthur, mary).
child_mother(angel, jane).
child_mother(anton, rita).
child_mother(alan, rita).
child_mother(axel, susan).
child_mother(ann, tina).    


% age(C, A) means C is of age A.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

age(amy, 6).
age(arthur, 15).
age(angel, 16).
age(anton, 4).
age(alan, 8).
age(axel, 16).
age(ann, 4).

% employed(X) means X is employed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

employed( susan).
employed(rita).

%Q1
%i
ecb(M) :-
	child_mother(C, M),
	age(C, N),
	N =< 14.
ecb(M) :-
	child_mother(C, M),
	\+employed(M),
	age(C, N),
	N >= 14,
	N =< 16.

%ii

mother_of_the_youngest(M) :-
	setof(A/M, C^(child_mother(C, M), age(C, A)), S),
	S = [A/M|_].

%iii
mothers_of_young(LM) :-
	setof(M, C^A^(child_mother(C, M), age(C, A), A =< 10), LM).

%2
%i
merge([H1], [H2], [H1, H2]).
merge([H1|L1], [H2|L2], [H1, H2|L]) :-
	merge(L1, L2, L).

%ii
findElement(1, [E|_], E).
findElement(N, [_|L], E) :-
	N1 is (N - 1),
	findElement(N1, L, E).
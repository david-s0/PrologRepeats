%3.1
del_l3(L, L1) :-
	append(L1, [_, _, _], L).

%3.2
last_a(I, L) :-
	append(_, [I], L).

last_r(I, [I]).
last_r(I, [_|L]) :-
	last_r(I, L).

%3.3
evenlength(L) :-
	append(L1, L2, L),
	length(L1, N1),
	length(L2, N2),
	N1 == N2.

oddlength(L) :-
	append(L1, [_], L),
	evenlength(L1).

%3.4
reverse([H], [H]).
reverse([HL|TL], RL) :-
	reverse(TL, RL2),
	append(RL2, [HL], RL).

%3.5
palindrome(L) :-
	reverse(L, L1),
	L == L1.

%3.6
shift([H|L], L2) :-
	append(L, [H], L2).

%3.7
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).

translate([H1], [H2]) :-
	means(H1, H2).
translate([H1|L1], [H2|L2]) :-
	translate(L1, L2),
	means(H1, H2).

%3.8
subset([], []).
subset([HSet|Set], [HSet|Sub]) :-
	subset(Set, Sub).
subset([_|Set], Sub):-
	subset(Set, Sub).

%3.9
dividelist(L, L1, L2) :-
	append(L1, L2, L),
	length(L1, N),
	length(L2, N).
dividelist(L, L1, L2) :-
	append(L1, L2, L),
	length(L1, N1),
	length(L2, N2),
	N1 is (N2 + 1).
dividelist(L, L1, L2) :-
	append(L1, L2, L),
	length(L1, N1),
	length(L2, N2),
	N1 is (N2 - 1).

%3.10
equal_length(L1, L2) :-
	length(L1, N),
	length(L2, N).

%3.11
flatten([], []).
flatten([H|L], FL) :-
	flatten(L, FL2),
	append(H, FL2, FL).

%3.17
maxlist([M], M).
maxlist([H1, H2|L], M) :-
	H1 =< H2,
	maxlist([H2|L], M).
maxlist([H1, H2|L], M) :-
	H1 > H2,
	maxlist([H1|L], M).

%3.18
sumlist([], 0).
sumlist([H|L], S) :-
	sumlist(L, S1),
	S is (S1 + H).

%3.19
ordered([_|[]]).
ordered([H1, H2|T]) :-
	H1 =< H2,
	ordered([H2|T]).

%3.20
subsum(Set, N, Sub) :-
	subset(Set, Sub),
	sumlist(Sub, N).

%3.21
between(N1, N2, X) :-
	N1 < X,
	N2 > X.
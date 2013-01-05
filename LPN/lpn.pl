%3.1
inside(katarina, olga).
inside(olga, natasha).
inside(natasha, irina).

in(X, Y) :-
	inside(X, Y).
in(X, Y) :-
	inside(X, Z),
	in(Z, Y).

%3.2
greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :-
	greater_than(X, Y).

%3.3
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(X, Y) :-
	directTrain(X, Y).
travelBetween(X, Y) :-
	directTrain(Y, X).
travelBetween(X, Y) :-
	directTrain(X, Z),
	travelBetween(Z, Y).

%Practical
%3.1
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

go(X, Y) :-
	byCar(X, Y).
go(X, Y) :-
	byCar(Y, X).
go(X, Y) :-
	byCar(X, Z),
	go(Z, Y).
go(X, Y) :-
	byCar(Y, Z),
	go(Z, X).
go(X, Y) :-
	byTrain(X, Y).
go(X, Y) :-
	byTrain(Y, X).
go(X, Y) :-
	byTrain(X, Z),
	go(Z, Y).
go(X, Y) :-
	byTrain(Y, Z),
	go(Z, X).
go(X, Y) :-
	byPlane(X, Y).
go(X, Y) :-
	byPlane(Y, X).
go(X, Y) :-
	byPlane(X, Z),
	go(Z, Y).
go(X, Y) :-
	byPlane(Y, Z),
	go(Z, X).

travel(X, Y) :-
	go(X, Y).

%3.4
travel(X, Y, go(X, Y, byCar)) :-
	byCar(X, Y).
travel(X, Y, go(X, Y, byTrain)) :-
	byTrain(X, Y).
travel(X, Y, go(X, Y, byPlane)) :-
	byPlane(X, Y).
travel(X, Y, go(X, Z, V, G)) :-
	travel(X, Z, go(X, Z, V)),
	travel(Z, Y, G).

%4.2
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([H], [H1]) :-
	tran(H, H1).
listtran([H|T], [H1|L]) :-
	listtran(T, L),
	tran(H, H1).
listtran([H], [H1]) :-
	tran(H1, H).
listtran([H|T], [H1|L]) :-
	listtran(T, L),
	tran(H1, H).

%4.3
twice([H], [H, H]).
twice([H|T], [H, H|L]) :-
	twice(T, L).

%Practical
%4.1
combine1(T, [], T).
combine1([], T, T).
combine1([H1], [H2], [H1, H2]).
combine1([H1|T1], [H2|T2], [H1, H2|T3]) :-
	combine1(T1, T2, T3).

%4.2
combine2(T, [], [T]).
combine2([], T, [T]).
combine2([H1], [H2], [[H1, H2]]).
combine2([H1|T1], [H2|T2], [[H1, H2]|T3]) :-
	combine2(T1, T2, T3).

%4.3
combine3(T, [], [T]).
combine3([], T, [T]).
combine3([H1], [H2], [join(H1, H2)]).
combine3([H1|T1], [H2|T2], [join(H1, H2)|T3]) :-
	combine3(T1, T2, T3).

%4.4.1
mysubset([], _).
mysubset([H|Sub], Set) :-
	member(H, Set),
	mysubset(Sub, Set).

%4.4.2
mysuperset(Sup, Set) :-
	mysubset(Set, Sup).

%6.1
doubled(L) :-
	append(L1, L2, L),
	L1 == L2.

%6.2
reverse([], []).
reverse([H|L], R) :-
	reverse(L, R1),
	append(R1, [H], R).

palindrome(L) :-
	reverse(L, L).

%6.3
%1
second(X, [_, X|_]).

%2
swap12([H1, H2|L], [H2, H1|L]).

%3
final(H, [H]).
final(X, [_|T]) :-
	final(X, T).

%4
toptail(InList, OutList) :-
	append([_|OutList], [_], InList).

%5
swapfl([H1|L1], [H2|L2]) :-
	append(L3, [H2], L1),
	append(L3, [H1], L2).

%6.4
%with help from the internet...
neigh(L, R, Houses) :- 
        Houses = [L|[R|_]].
neigh(L, R, Houses) :- 
        Houses = [_|[L|R]].

zebraowner(Houses, ZebraOwner):-
        member([englishman, _, red], Houses),
        member([spanish, jaguar, _], Houses),
        neigh([_, snail, _], [japanese, _, _], Houses),
        neigh([_, snail, _], [_, _, blue], Houses),
        member([ZebraOwner, zebra, _], Houses),
        member([_, _, green], Houses).

zebra(X) :-
	zebraowner([_, _, _], X).

%Practical
%6.1
member2(E, L) :-
	append(_, [E|_], L).

%6.2
set(L, S) :-
	setof(E, member(E, L), S).

%6.3
flatten([], []).
flatten([H|L], F) :-
	flatten(L, F1),
	append(H, F1, F).
%known gates
xorgate(g1).
xorgate(g2).
andgate(g3).
andgate(g4).
orgate(g5).

%known relationships
input1(g1, 1).
input1(g2, I) :-
	output(g1, I).
input1(g3, 1).
input1(g4, 1).
input1(g5, I) :-
	output(g3, I).
input2(g1, 0).
input2(g2, 1).
input2(g3, I) :-
	output(g1, I).
input2(g4, 0).
input2(g5, I) :-
	output(g4, I).

%truth tables
and_table(1, 1, 1).
and_table(0, _, 0).
and_table(_, 0, 0).
or_table(0, 0, 0).
or_table(1, _, 1).
or_table(_, 1, 1).
xor_table(I1, I2, 0) :-
	I1 == I2.
xor_table(1, 0, 1).
xor_table(0, 1, 1).

%outputs redirections
output(G, O) :-
	andgate(G),
	input1(G, I1),
	input2(G, I2),
	and_table(I1, I2, O).
output(G, O) :-
	orgate(G),
	input1(G, I1),
	input2(G, I2),
	or_table(I1, I2, O).
output(G, O) :-
	xorgate(G),
	input1(G, I1),
	input2(G, I2),
	xor_table(I1, I2, O).

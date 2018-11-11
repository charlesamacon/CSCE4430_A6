% Charles Alan Macon
% CSCE 4115 - Assignment 6

% Similar to several solutions found online, but not the same because we need to run it multiple times
:-use_module(library(lambda)).

% Main()
cracker:-
	cracker(Moves).
 
cracker(Moves):-
	play([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves),
	writeln("=== 0 ==="),
	display(Moves, [1]),
	play([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves1),
        writeln("=== 1 ==="),
	display(Moves1, [2]),
	play([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves2),
        writeln("=== 2 ==="),
	display(Moves2, [3]),
	play([4], [1,2,3,5,6,7,8,9,10,11,12,13,14,15], [], Moves3),
        writeln("=== 3 ==="),
	display(Moves3, [4]),
        play([5], [1,2,3,4,6,7,8,9,10,11,12,13,14,15], [], Moves4),
        writeln("=== 4 ==="),
        display(Moves4, [5]).

play(_, [_], Lst, Moves):-
	reverse(Lst, Moves).

play(FreeSpot, Occupied, Lst, Moves):-
	select(S, Occupied, O_1),
	select(O, O_1, O_2),
	select(E, FreeSpot, F),
	moves(S, O, E),
	play([S, O | F], [E | O_2], [moves(S, O, E) | Lst], Moves).

% All the different moves available
% From / Over / To
moves(S,2,E):-
	member([S,E], [[1,4], [4,1]]).
moves(S,3,E):-
	member([S,E], [[1,6], [6,1]]).
moves(S,4,E):-
	member([S,E], [[2,7], [7,2]]).
moves(S,5,E):-
	member([S,E], [[2,9], [9,2]]).
moves(S,5,E):-
	member([S,E], [[3,8], [8,3]]).
moves(S,6,E):-
	member([S,E], [[3,10], [10,3]]).
moves(S,5,E):-
	member([S,E], [[4,6], [6,4]]).
moves(S,7,E):-
	member([S,E], [[4,11], [11,4]]).
moves(S,8,E):-
	member([S,E], [[4,13], [13,4]]).
moves(S,8,E):-
	member([S,E], [[5,12], [12,5]]).
moves(S,9,E):-
	member([S,E], [[5,14], [14,5]]).
moves(S,9,E):-
	member([S,E], [[6,13], [13,6]]).
moves(S,10,E):-
	member([S,E], [[6,15], [15,6]]).
moves(S,8,E):-
	member([S,E], [[9,7], [7,9]]).
moves(S,9,E):-
	member([S,E], [[10,8], [8,10]]).
moves(S,12,E):-
	member([S,E], [[11,13], [13,11]]).
moves(S,13,E):-
	member([S,E], [[12,14], [14,12]]).
moves(S,14,E):-
	member([S,E], [[15,13], [13,15]]).

% Completely based on the Rosetta Code version -> Could never get it to display properly outside of a moves list.
display([], Free) :-
	numlist(1, 15, Lst),
	maplist(\X^I^(member(X, Free) -> I = "."; I = "x"), Lst,[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format("~n      ~w         ~n", [I1]),
	format("     ~w ~w       ~n", [I2,I3]),
	format("    ~w ~w ~w     ~n", [I4,I5,I6]),
	format("   ~w ~w ~w ~w   ~n", [I7,I8,I9,I10]),
	format("  ~w ~w ~w ~w ~w ~n~n", [I11,I12,I13,I14,I15]),
	writeln("").

display([moves(S, M, E) | T], Free) :-
	numlist(1, 15, Lst),
	maplist(\X^I^(member(X, Free) -> I = "."; I = "x"), Lst, [I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format("     ~w          ~n", [I1]), 
	format("    ~w ~w        ~n", [I2,I3]),
	format("   ~w ~w ~w      ~n", [I4,I5,I6]),
	format("  ~w ~w ~w ~w    ~n", [I7,I8,I9,I10]),
	format(" ~w ~w ~w ~w ~w  ~n", [I11,I12,I13,I14,I15]),
	select(E, Free, F),
	display(T,  [S, M | F]).

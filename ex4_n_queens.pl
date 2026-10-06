% Ex.No: 4 - N-Queens Problem
% Aim: Write a program to solve the N-Queens problem.
%
% Algorithm (backtracking):
%   1) Start with an empty NxN board.
%   2) Place a queen in a row; a position is safe if no queen is in the same
%      column, left diagonal or right diagonal.
%   3) If safe, place it and move on; otherwise backtrack and try another position.
%   4) Continue until all N queens are placed.
%
% Board = board(Queens, FreeRows, FreeCols, FreeDiag1, FreeDiag2)

% Main predicate: nqueens(N, Cols)
% Cols is a list; the I-th element is the column of the queen in row I.
nqueens(N, Cols) :-
    make_list(N, L),
    D is 2 * N - 1,
    make_list(D, LL),
    place_n(N, board([], L, L, LL, LL), board(Queens, _, _, _, _)),
    findall(R-C, member(q(R, C), Queens), Pairs),
    keysort(Pairs, Sorted),
    findall(C, member(_-C, Sorted), Cols).

% Print every solution:  ?- all_queens(4).
all_queens(N) :-
    nqueens(N, Cols),
    write(Cols), nl,
    fail.
all_queens(_).

% Place N queens
place_n(_, board(D, [], [], D1, D2), board(D, [], [], D1, D2)) :- !.
place_n(N, Board1, Result) :-
    place_a_queen(N, Board1, Board2),
    place_n(N, Board2, Result).

% Place a single queen
place_a_queen(N,
    board(Queens, Rows, Cols, Diag1, Diag2),
    board([q(R, C) | Queens], NewR, NewC, NewD1, NewD2)) :-
    next_row(R, Rows, NewR),
    find_and_remove(C, Cols, NewC),
    DA is N + C - R,
    find_and_remove(DA, Diag1, NewD1),
    DB is R + C - 1,
    find_and_remove(DB, Diag2, NewD2).

% Remove an element
find_and_remove(X, [X | Rest], Rest).
find_and_remove(X, [Y | Rest], [Y | Tail]) :-
    find_and_remove(X, Rest, Tail).

% Create list [N, N-1, ..., 1]
make_list(0, []) :- !.
make_list(N, [N | Rest]) :-
    N > 0,
    M is N - 1,
    make_list(M, Rest).

% Select row
next_row(Row, [Row | Rest], Rest).

% Sample queries:
% ?- nqueens(4, S).
% S = [2,4,1,3] ? ;
% S = [3,1,4,2] ? ;
% no

% Ex.No: 3 - Water Jug Problem (4-litre and 3-litre jugs)
% Aim: Solve the water jug problem using Prolog. Goal: exactly 2 litres in the 4-litre jug.
%
% Algorithm:
%   1) Two jugs of capacity 4 and 3 litres.  Initial state = (0,0).
%   2) Operations: fill 4, fill 3, empty 4, empty 3, pour 4->3, pour 3->4.
%   3) Generate new states using these operations.
%   4) Avoid states that were already visited.
%   5) Continue until state (2,0) is reached, then display the sequence of states.

% State is represented as state(Jug4, Jug3)

move(fill_4,   state(X, Y), state(4, Y)) :- X < 4.
move(fill_3,   state(X, Y), state(X, 3)) :- Y < 3.
move(empty_4,  state(X, Y), state(0, Y)) :- X > 0.
move(empty_3,  state(X, Y), state(X, 0)) :- Y > 0.
move(pour_4_3, state(X, Y), state(X1, Y1)) :-
    X > 0, Y < 3,
    T is min(X, 3 - Y),
    X1 is X - T,
    Y1 is Y + T.
move(pour_3_4, state(X, Y), state(X1, Y1)) :-
    Y > 0, X < 4,
    T is min(Y, 4 - X),
    X1 is X + T,
    Y1 is Y - T.

% Depth-first search with a visited list
search(Goal, Goal, _, []) :- !.
search(State, Goal, Visited, [step(Action, State, Next) | Steps]) :-
    move(Action, State, Next),
    \+ member(Next, Visited),
    search(Next, Goal, [Next | Visited], Steps).

action_text(fill_4,   'Fill the 4-litre jug').
action_text(fill_3,   'Fill the 3-litre jug').
action_text(empty_4,  'Empty the 4-litre jug on the ground').
action_text(empty_3,  'Empty the 3-litre jug on the ground').
action_text(pour_4_3, 'Pour water from 4-litre jug to 3-litre jug until it is full').
action_text(pour_3_4, 'Pour water from 3-litre jug to 4-litre jug').

print_steps([]) :-
    write('Goal reached: exactly 2 litres in the 4-litre jug.'), nl.
print_steps([step(A, state(X1, Y1), state(X2, Y2)) | T]) :-
    action_text(A, Text),
    format('~w: ~w,~w --> ~w,~w~n', [Text, X1, Y1, X2, Y2]),
    print_steps(T).

% Run with:  ?- solve.
solve :-
    Start = state(0, 0),
    Goal  = state(2, 0),
    search(Start, Goal, [Start], Steps),
    print_steps(Steps).

% Expected output:
% Fill the 4-litre jug: 0,0 --> 4,0
% Fill the 3-litre jug: 4,0 --> 4,3
% Empty the 4-litre jug on the ground: 4,3 --> 0,3
% Pour water from 3-litre jug to 4-litre jug: 0,3 --> 3,0
% Fill the 3-litre jug: 3,0 --> 3,3
% Pour water from 3-litre jug to 4-litre jug: 3,3 --> 4,2
% Empty the 4-litre jug on the ground: 4,2 --> 0,2
% Pour water from 3-litre jug to 4-litre jug: 0,2 --> 2,0
% Goal reached: exactly 2 litres in the 4-litre jug.

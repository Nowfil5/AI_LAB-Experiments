% Ex.No: 5 - Monkey Banana Problem
% Aim: Write a program to solve the Monkey Banana problem.
%
% Algorithm:
%   1) Start with the initial state of the monkey, box and banana.
%   2) If the monkey is not under the banana, move it to the box.
%   3) Push the box below the banana.
%   4) Climb onto the box.
%   5) If the monkey is on the box and under the banana, it can reach it.
%   6) Grasp the banana and display the plan.
%
% State = state(MonkeyPos, MonkeyOnBox, BoxPos, HasBanana)
% The banana hangs from the ceiling in the middle of the room.

position(atdoor).
position(middle).
position(atwindow).

% grasp the banana: monkey is on the box in the middle
move(state(middle, onbox, middle, hasnot), grasp,
     state(middle, onbox, middle, has)).

% climb onto the box (monkey and box at same place)
move(state(P, onfloor, P, H), climb,
     state(P, onbox, P, H)).

% push the box from P1 to P2
move(state(P1, onfloor, P1, H), push(P1, P2),
     state(P2, onfloor, P2, H)) :-
    position(P2), P2 \== P1.

% walk from P1 to P2
move(state(P1, onfloor, B, H), walk(P1, P2),
     state(P2, onfloor, B, H)) :-
    position(P2), P2 \== P1.

% Goal test
goal(state(_, _, _, has)).

% Plan search (iterative deepening -> shortest plan)
plan(State, []) :- goal(State).
plan(State, [Move | Moves]) :-
    move(State, Move, Next),
    plan(Next, Moves).

% Run with:  ?- monkey.
monkey :-
    Start = state(atdoor, onfloor, atwindow, hasnot),
    length(Plan, _),
    plan(Start, Plan), !,
    write('Plan: '), write(Plan), nl,
    write('Monkey gets the banana'), nl.

% Expected output:
% Plan: [walk(atdoor,atwindow),push(atwindow,middle),climb,grasp]
% Monkey gets the banana

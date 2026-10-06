% Ex.No: 2 - Basics of Prolog
% Aim: Understand the basics of Prolog and its working environment.
%
% Algorithm:
%   1) Open the Prolog interpreter.
%   2) Familiarize yourself with basic commands and syntax.
%   3) Write and test simple facts and rules.

% ---------- Program 1: Sum of two numbers ----------
sum(X, Y) :-
    S is X + Y,
    write(S), nl.

% ---------- Program 2: Facts and rules ----------
% Facts
male(john).
female(mary).
parent(john, mary).

% Rules
father(X, Y) :- male(X),   parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% ---------- Sample queries ----------
% ?- sum(-10, 20).
% 10
% true.
%
% ?- father(john, mary).
% true.
%
% ?- mother(john, mary).
% false.

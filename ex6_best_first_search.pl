% Ex.No: 6 - Implementation of Best First Search
% Aim: Apply the best first search algorithm to solve a problem.
%
% Algorithm:
%   1) Define the problem and search space (graph given as connected/3 facts).
%   2) Keep a frontier of paths ordered by cost; always expand the cheapest one.
%   3) Test the program with sample queries.

% Facts: connected(From, To, Cost)
connected(a, b, 1).
connected(a, c, 3).
connected(b, d, 1).
connected(c, d, 1).

% best_first_search(Start, Goal, Path, Cost)
best_first_search(Start, Goal, Path, Cost) :-
    search([0-[Start]], Goal, RevPath, Cost),
    reverse(RevPath, Path).

% Goal found at the head of the best path
search([Cost-[Goal | Rest] | _], Goal, [Goal | Rest], Cost) :- !.

% Otherwise expand the best path, add children, re-sort by cost
search([Cost-[Node | Rest] | Others], Goal, Solution, TotalCost) :-
    findall(NewCost-[Next, Node | Rest],
            ( connected(Node, Next, W),
              \+ member(Next, [Node | Rest]),
              NewCost is Cost + W ),
            Children),
    append(Others, Children, Frontier0),
    keysort(Frontier0, Frontier),
    search(Frontier, Goal, Solution, TotalCost).

% Sample query:
% ?- best_first_search(a, d, Path, Cost).
% Path = [a,b,d]
% Cost = 2

% Ex.No: 7 - Implementation of DFS
% Aim: Implement the depth first search algorithm in Prolog.
%
% Algorithm:
%   1) Start from the given initial node.
%   2) Mark the current node as visited.
%   3) If the current node is the goal, return the path.
%   4) Otherwise select an unvisited connected node and repeat.
%   5) If no unvisited node is available, backtrack to the previous node.
%   6) Display the DFS path.

% Facts
connected(a, b).
connected(a, c).
connected(b, d).
connected(c, e).
connected(d, f).

% dfs(Start, Goal, Path)
dfs(Start, Goal, Path) :-
    dfs(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

% Goal reached
dfs(Goal, Goal, Visited, Visited).

% Move to an unvisited neighbour
dfs(Node, Goal, Visited, Path) :-
    connected(Node, Next),
    \+ member(Next, Visited),
    dfs(Next, Goal, [Next | Visited], Path).

% Sample query:
% ?- dfs(a, f, Path).
% Path = [a,b,d,f]

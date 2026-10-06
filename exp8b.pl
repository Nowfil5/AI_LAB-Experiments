% FACTS
high_revenue(techCorp).
low_debt(techCorp).

% RULES
financially_strong(X) :- 
    high_revenue(X), 
    low_debt(X).

good_investment(X) :- 
    financially_strong(X).

consults(investor, advisor, X) :- 
    good_investment(X).

recommends(advisor, investor, X) :- 
    good_investment(X).



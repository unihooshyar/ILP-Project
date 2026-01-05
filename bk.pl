% Single-parent lineage to bypass recall issues
parent(george, mary). 
parent(george, david).
parent(mary, sophie). 
parent(mary, james).
parent(david, lucas). 
parent(david, olivia).
parent(sophie, jack).

% Genders (keep these for Uncle-Aunt task later)
male(george). male(david). male(james). male(lucas). male(jack).
female(emma). female(mary). female(sophie). female(olivia).

% Sibling facts for BK
sibling(mary, david).
sibling(david, mary).
sibling(sophie, james).
sibling(james, sophie).
sibling(lucas, olivia).
sibling(olivia, lucas).

% Logic helpers
child_of(X, Y) :- parent(Y, X).
diff(X, Y) :- X \= Y.
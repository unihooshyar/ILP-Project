% Initialize Aleph
:- aleph.

% head_pred(ancestor, 2).
% type(ancestor, (person, person)).
% direction(ancestor, (in, out)).
:- modeh(*, ancestor(+person, -person)).

% body_pred(parent, 2).
% type(parent, (person, person)).
% direction(parent, (in, out)).
:- modeb(*, parent(+person, -person)).

:- determination(ancestor/2, parent/2).

% enable_recursion.
:- determination(ancestor/2, ancestor/2).

% max_vars(3).
:- aleph_set(i, 3).

% max_body(2).
:- aleph_set(clauselength, 2 + 1).

% --------------------
% Background Knowledge
% --------------------

:- begin_bg.

parent(george, mary). 
parent(george, david).
parent(mary, sophie). 
parent(mary, james).
parent(david, lucas). 
parent(david, olivia).
parent(sophie, jack).

male(george). male(david). male(james). male(lucas). male(jack).
female(emma). female(mary). female(sophie). female(olivia).

sibling(mary, david).
sibling(david, mary).
sibling(sophie, james).
sibling(james, sophie).
sibling(lucas, olivia).
sibling(olivia, lucas).

child_of(X, Y) :- parent(Y, X).
diff(X, Y) :- X \= Y.

:- end_bg.

% --------
% Examples
% --------

:- begin_in_pos.

ancestor(george, mary).
ancestor(george, sophie).
ancestor(george, jack).

:- end_in_pos.

:- begin_in_neg.

ancestor(jack, george).

:- end_in_neg.

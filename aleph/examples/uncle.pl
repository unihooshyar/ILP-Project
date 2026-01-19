% Initialize Aleph
:- aleph.

% head_pred(uncle, 2).
% type(uncle, (person, person)).
% direction(uncle, (in, out)).
:- modeh(*, uncle(+person, -person)).

% body_pred(parent, 2).
% type(parent, (person, person)).
% direction(parent, (in, out)).
:- modeb(*, parent(+person, -person)).

% body_pred(sibling, 2).
% type(sibling, (person, person)).
% direction(sibling, (in, out)).
:- modeb(*, sibling(+person, -person)).

% body_pred(male, 1).
% type(male, (person,)).
% direction(male, (in,)).
:- modeb(*, male(+person)).

:- determination(uncle/2, parent/2).
:- determination(uncle/2, sibling/2).
:- determination(uncle/2, male/1).

% max_vars(4).
:- aleph_set(i, 4).

% max_body(3).
:- aleph_set(clauselength, 3 + 1).

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

uncle(david, sophie).
uncle(david, james).

:- end_in_pos.

:- begin_in_neg.

uncle(mary, lucas).
uncle(mary, sophie).

uncle(george, mary).
uncle(david, mary).

:- end_in_neg.

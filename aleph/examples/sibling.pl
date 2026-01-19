% Initialize Aleph
:- aleph.

% head_pred(sibling, 2).
% type(sibling, (person, person)).
:- modeh(*, sibling(+person, -person)).

% body_pred(parent, 2).
% type(parent, (person, person)).
:- modeb(*, parent(+person, -person)).

% body_pred(diff, 2).
% type(diff, (person, person)).
:- modeb(*, diff(+person, -person)).

:- determination(sibling/2, parent/2).
:- determination(sibling/2, diff/2).

% max_vars(3).
:- aleph_set(i, 3).

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

diff(george, mary).
diff(george, david).
diff(george, sophie).
diff(george, james).

diff(mary, george).
diff(mary, david).
diff(mary, sophie).
diff(mary, james).

diff(david, george).
diff(david, mary).
diff(david, sophie).
diff(david, james).

diff(sophie, george).
diff(sophie, mary).
diff(sophie, david).
diff(sophie, james).

diff(james, george).
diff(james, mary).
diff(james, david).
diff(james, sophie).

:- end_bg.

% --------
% Examples
% --------

:- begin_in_pos.

sibling(mary, david).
sibling(sophie, james).

:- end_in_pos.

:- begin_in_neg.

sibling(mary, mary).
sibling(george, mary).
sibling(mary, sophie).
sibling(george, james).
sibling(david, sophie).

:- end_in_neg.

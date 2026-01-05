head_pred(uncle, 2).
body_pred(parent, 2).
body_pred(sibling, 2).
body_pred(male, 1).

type(uncle, (person, person)).
type(parent, (person, person)).
type(sibling, (person, person)).
type(male, (person,)).

direction(uncle, (in, out)).
direction(male, (in,)).
direction(sibling, (in, out)).
direction(parent, (in, out)).

max_vars(4).
max_body(3).
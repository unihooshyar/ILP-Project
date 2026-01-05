head_pred(aunt, 2).
body_pred(parent, 2).
body_pred(sibling, 2).
body_pred(female, 1).

type(aunt, (person, person)).
type(parent, (person, person)).
type(sibling, (person, person)).
type(female, (person,)).

direction(aunt, (in, out)).
direction(female, (in,)).
direction(sibling, (in, out)).
direction(parent, (in, out)).

max_vars(4).
max_body(3).
% -----------------------------
% Head predicate
% -----------------------------
head_pred(sibling, 2).
type(sibling, (person, person)).

% -----------------------------
% Body predicates
% -----------------------------
body_pred(parent, 2).
body_pred(diff, 2).

type(parent, (person, person)).
type(diff, (person, person)).

% -----------------------------
% Bias constraints
% -----------------------------
max_vars(3).
min_body(3).
max_body(3).

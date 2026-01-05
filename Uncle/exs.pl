% Positive Examples
pos(uncle(david, sophie)).
pos(uncle(david, james)).

% Negative Examples: Gender Check
neg(uncle(mary, lucas)).   % Mary is female
neg(uncle(mary, sophie)).  % Mary is female

% Negative Examples: Relationship Check
neg(uncle(george, mary)).  % George is a parent
neg(uncle(david, mary)).   % David is a sibling, not an uncle
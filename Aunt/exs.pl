% Positive Examples
pos(aunt(mary, lucas)).
pos(aunt(mary, olivia)).

% Negative Examples: Gender Check
neg(aunt(david, sophie)).  % David is male
neg(aunt(david, lucas)).   % David is male

% Negative Examples: Relationship Check
neg(aunt(emma, david)).    % Emma is a parent
neg(aunt(sophie, jack)).   % Sophie is a parent
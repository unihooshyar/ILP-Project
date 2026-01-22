%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- set(h, 100)?
:- set(clauselength, 5)?
:- set(nodes, 5000)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mode declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- modeh(1, ancestor(+person, -person))?
:- modeb(*, parent(+person, -person))?
:- modeb(*, ancestor(+person, -person))?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Types
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

male(george).
male(david).
male(james).
male(lucas).
male(jack).

female(emma).
female(mary).
female(sophie).
female(olivia).

person(george).
person(david).
person(james).
person(lucas).
person(jack).
person(emma).
person(mary).
person(sophie).
person(olivia).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Positive Examples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ancestor(george, mary).
ancestor(george, david).
ancestor(mary, sophie).
ancestor(mary, james).
ancestor(david, lucas).
ancestor(david, olivia).
ancestor(sophie, jack).
ancestor(george, sophie).
ancestor(george, jack).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Negative Examples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- ancestor(mary, george).
:- ancestor(david, george).
:- ancestor(sophie, mary).
:- ancestor(james, mary).
:- ancestor(lucas, david).
:- ancestor(olivia, david).
:- ancestor(jack, sophie).
:- ancestor(sophie, george).
:- ancestor(jack, george).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Background Knowledge
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parent(george, mary).
parent(george, david).
parent(mary, sophie).
parent(mary, james).
parent(david, lucas).
parent(david, olivia).
parent(sophie, jack).

sibling(mary, david).
sibling(david, mary).
sibling(sophie, james).
sibling(james, sophie).
sibling(lucas, olivia).
sibling(olivia, lucas).

child_of(X, Y) :- parent(Y, X).
diff(X, Y) :- X \= Y.

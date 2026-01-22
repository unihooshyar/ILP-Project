%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- set(h, 10000)?
:- set(clauselength, 10)?
:- set(nodes, 10000)?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mode declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- modeh(1, aunt(+person,+person))?
:- modeb(1, female(+person))?
:- modeb(1, parent(-person,+person))?
:- modeb(1, parent(+person,-person))?
:- modeb(1, sibling(+person,+person))?

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

aunt(mary, lucas).
aunt(mary, olivia).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Negative Examples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- aunt(lucas, mary).
:- aunt(olivia, mary).
:- aunt(david, sophie).
:- aunt(david, lucas).
:- aunt(emma, david).
:- aunt(sophie, jack).
:- aunt(mary, mary).
:- aunt(george, mary).
:- aunt(george, david).
:- aunt(george, sophie).
:- aunt(george, james).
:- aunt(george, lucas).
:- aunt(george, olivia).
:- aunt(george, jack).
:- aunt(george, emma).
:- aunt(emma, george).

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

%sibling(X, Y) :- sibling(Y, X).
child_of(X, Y) :- parent(Y, X).
diff(X, Y) :- X \= Y.

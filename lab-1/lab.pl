% 1.1 Which of the following sequences of characters are atoms, which are variables, and which are neither?

vINCENT % atom
Footmassage % variable
variable23 % atom
Variable2000 %atom
big_kahuna_burger % atom
'big kahuna burget' % atom (single-quote)
big kahuna burger % neither
'Jules' %atom
_Jules % variable (don't care)
'_Jules' % atom

% 1.2 Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all? Give the functor and arity of each complex term.

loves(Vincent, mia) % complex term (loves/2)
'loves(Vincent, mia)' % atom
Butch(boxer) % not a term (variable cannot be used as a functor)
boxer(Butch) % complex term (boxer/1)
and(big(burger), kahuna(burger)) % complex term (and/2)
and(big(X), kahuna(X)) % complex term (and/2)
_and(big(X), kahuna(X)) % not a term (variable cannot be used as a functor)
(Butch Kills Vincent) % not a term (missing functor and commas)
kills(Butch Vincent) % not a term (missing commas)
kills(Butch, Vincent % not a term (missing parenthesis)

% 1.3 How many facts, rules, clauses, and predicates are there in the following knowledge base? What are the heads of the rules, and what are the goals they contain?


woman(vincent). % fact
woman(mia). % fact
man(jules). % fact
person(X) :- man(X); woman(X). % rules
loves(X,Y) :- father(X,Y). % rules
father(Y,Z) :- man(Y), son(Z,Y). % rules
father(Y,Z) :- man(Y), daughter(Z,Y). % rules

% Total 3 facts, 4 rules, 7 predicates in 7 clauses

% 1.4 Represent the following in Prolog:

% Butch is killer
killer(butch).
% Mia and Marsellus are married
married(mia, marsellus).
% Zed is dead
dead(zed).
% Marsellus kills everyone who gives Mia a footmassage
kills(marsellus, X) :- gives(X, mia, footmassage).
% Mia loves everyone who is a good dancer
loves(mia, X) :- good_dancer(X).
% Jules eats anything that is nutritious or tasty
eats(jules, X) :- nutritious(X) ; tasty(X).

% 1.5 Suppose we are working with the following knowledge base:
wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X):- hasBroom(X), hasWand(X).
hasBroom(X):- quidditchPlayer(X).

% How does Prolog respond to the following queries?
wizard(ron) % True
witch(ron) % ERROR: toplevel: Undefined procedure: witch/1
wizard(hermione) % False
witch(hermione) % ERROR: toplevel: Undefined procedure: witch/1
wizard(harry) % True => hasBroom(harry) -> quidditchPlayer(harry) -> True
              % and hasWand(harry) -> True hence True AND True evaluates True
wizard(Y). % Y = ron; Y = harry.
witch(Y). % ERROR: toplevel: Undefined procedure: witch/1

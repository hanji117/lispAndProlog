


grandparent(A,B) :- parent(A,X), parent(X,B). 
ancestor(A,B) :- parent(A,B).
descendant(A,B) :- parent(B,A).
sibling(A,B) :- parent(X,A), parent(X,B), A\=B.
child(A,B) :-  parent(B,A).
grandchild(A,B) :- parent(B,X), parent(X,A).
father(A,B) :- male(A), parent(A,B).
mother(A,B) :- female(A), parent(A,B).
grandmother(A,B) :- female(A), parent(A,X), parent(X,B).
grandfather(A,B) :- male(A), parent(A,X), parent(X,B).
son(A,B) :- male(A), parent(B,A).
daughter(A,B) :- female(A), parent(B,A).
granddaughter(A,B) :- female(A), parent(B,X), parent(X,A).
grandson(A,B) :- male(A), parent(B,X), parent(X,A).
sister(A,B) :- female(A), parent(X,A), parent(X,B), A\=B.
brother(A,B) :- male(A), parent(X,A), parent(X,B), A\=B.


in(joe,cs111).
in(joe,cs351).
in(joe,math100).
in(mary,cs111).
in(mary,eng251).
in(mary,math100).
in(bob,eng251).
in(bob,soc150).
in(julia,chem125).

shareSomeClass(X,Y) :- in(X,Z), in(Y,Z), X\=Y.

shareThisClass(X,Y,Class) :- in(X,Class), in(Y,Class), X\=Y. 

share2Classes(X,Y) :- in(X,Class1), in(Y,Class1), in(X,Class), in(Y,Class2), X\=Y, Class1\=Class2.

def(A,R):-R is A rem 2.
powtwo(1):-!.
powtwo(N):-RE is N rem 2,
           RE =:=0,
           N2 is N / 2,
           powtwo(N2).
powtwom(N):-powtwo(N+1).
npowtwom(N):- \+powtwom(N).
add([],_,_,[]).
add([H|T],C,E,[H,E|RT]):-powtwom(C),!,
                          C2 is C+1,
                          add(T,C2,E,RT).
add([H|T],C,E,[H|RT]):- C2 is C+1,
                        add(T,C2,E,RT).

teste:-add([1, 2, 3,4, 5, 6, 7, 8, 9, 10],1,0,[1 ,0, 2, 3, 0, 4, 5, 6, 7, 0, 8, 9, 10]),
       add([1, 2 ,3 ,4],1,0,[1, 0, 2, 3, 0, 4]),
       add([1 ,2 ,3 ,4 ,5 ,6 ,7, 8],1, 0, [1, 0, 2, 3, 0, 4, 5 ,6, 7, 0, 8]),
       add([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],1,0,[1,0,2,3,0,4,5,6,7,0,8,9,10,11,12,13,14,15,0,16]).

%model matematic:
%
%		     {[] , n=0
%remove([l1...ln],c)={[l2...ln] , c=1
%		     {l1 U remove([l2...ln],c-1) , c!=1
%
%informatii:
%remove(L-list,C-number,R-list)
%flow model(i,i,o)
%
remove([],_,[]).
remove([_|T],C,T) :- C=:=1, !.
remove([H|T],C,[H|RT]) :-
		        remove(T,C-1,RT).

test1:-remove([],4,[]),
	remove([1,2,3,4],1,[2,3,4]),
	remove([3,4,5,6,7],3,[3,4,6,7]),
	remove([1,2,3],3,[1,2]),
	remove([1,2,3],5,[1,2,3]).

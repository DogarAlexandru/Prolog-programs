%Problem 12 a: . Write a predicate to substitute in a list a value with all the elements of another list.
%model matematic:
%
%                           { [] , n=0
%sub([l1...ln],[i1...in],v)={ [[i1...in],l2...ln] , l1=v
%			    { l1 U sub([l2...ln],[i1...in],v) , l1!=v
%
%informatii:
%sub(I-list,L-list,E-number,R-list)
%flow model(i,i,i,o)


sub([],_,_,[]).
sub([H|T],L,E,[L|T]) :- H=:=E, !.
sub([H|T],L,E,[H|RT]) :- sub(T,L,E,RT).




test :- sub([],[1,3,4],3,[]),
	sub([1,3,2,4],[2,2,3],1,[[2,2,3],3,2,4]),
	sub([1,2,3],[1,2],2,[1,[1,2],3]),
	sub([1,2,3],[1,2],5,[1,2,3]).

%a. Merge two sorted lists with removing the double values.
%b. For a heterogeneous list, formed from integer numbers and list of
% numbers, merge all sublists with removing
%the double values.
%[1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
%[1, 2, 3, 4, 6, 7, 9, 10, 11].
%
%Math Model:
%a:
%
%                           {[] , l=0 , r=0
%                           {l1 U merge([l2...ln],[]) , r=0
%merge([l1...ln],[r1...rn])={r1 U merge([],[r1...rn]) , l=0
%                           (l1 U merge([l2...ln],[r1...rn]) , l1 < r1
%                           {r1 U merge([l1...ln],[r2...rn]) , l1 > r1
%                           {merge([l2...ln],[r2...rn]) , l1==r1
%b:
%
%
%
%                   {[] , l=0
%parse([l1...ln],O)={parse([l2...ln],O) , l1 - number
%                   {parse([l2...ln]],merge(O,l1)) l2- list
%
%
%a:
%merge(L - list , R - list , O - list)
%merge flow model (i,i,o)
%
%
%b:
%parse(L - List , C - collector , O - list)
%parse flow model(i,i,o)
%
%
%



clear([],[]).
clear([A],[A]).
clear([H1,H2|T],[H1|TO]):- H1 =\= H2,
                           clear([H2|T],TO).
clear([H1,H2|T],TO):-H1=:=H2,
                        clear([H2|T],TO).




merge([],[],[]).
merge([H|T],[],[H|TO]):-merge(T,[],TO).
merge([],[H|T],[H|TO]):-merge([],T,TO).
merge([HL|TL],[HR|TR],[HL|TO]):- HL<HR,
                                merge(TL,[HR|TR],TO).

merge([HL|TL],[HR|TR],[HR|TO]):- HL>HR,
                                merge([HL|TL],TR,TO).
merge([HL|TL],[HR|TR],[HR|TO]):- HL=:=HR,
                                merge(TL,TR,TO).



parse([],[]).
parse([H|T],O):- number(H),
                   parse(T,O).
parse([H|T],O):- is_list(H),
                  clear(H,HCL),
                  parse(T,O2),
                  merge(HCL,O2,O).


wparse(L,O):- parse(L,O).


testparse:- parse([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8],[1, 2, 3, 4, 6, 7, 9, 10, 11]),
	   parse([],[]),
	 parse([1,3,4,1],[]),
	parse([1,2,3,[1],3],[1]).
testmerge:- merge([1,2],[3,4],[1,2,3,4]),
           merge([1,2],[],[1,2]),
           merge([1,2,3],[1,4,5],[1,2,3,4,5]),
           merge([],[1,2],[1,2]),
           merge([1,3,5],[1,2,3,4,5],[1,2,3,4,5]).
test:-testparse,
    testmerge.



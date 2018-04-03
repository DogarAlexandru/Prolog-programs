% 9. Generate all permutation of N (N - given) respecting the property:
% for every 2<= i<=n exists an 1<=j<=i, so |v(i)-v(j)|=1.
%
%
%-----condition:
%-true if there is no element in list l that is e+1 or e-1
%
%                       { true , n=0
%condition([l1...ln],e)={ false , (l1==e+1 or l1==e-1) and n!=0
%                       { condition([l2...ln],e),l1!=e+1 and l1!=e-1 and n!=0
%
%condition(L-list,E-number)
%condition flow model(i,i)
%
%
%
%----conditionn:
%-true if condition is false
%
%
%conditionn(L-list,E-number)
%conditionn flow model(i,i)
%
%
%
%-----insert:
%
%
%                    {[E],n=0
%insert([l1...ln],e)={[e,l1...ln],n>0
%                    {insert([l2...ln],e) , n>0
%
%insert(L-list,E-number,R-list)
%insert flow model(i,i,o)
%
%
%
%-----perm:
%
%
%perm([l1...ln])={insert(l1,perm(l2...ln))
%
%
%perm(L-list,R-list)
%perm flow model(i,o)
%
%
%
%-----condfinaux
%
%
%                      {true , n=0
%condfinaux([l1...ln])={false, conditionn(l1,[l2...ln]) false
%                      {condfinaux([l2...ln]) , conditionn(l1,[l2...ln]) true
%
%condfinaux(L-list)
%condfinaux flow model(i)
%
%
%-----condfin:
%-true if condfinaux(reverse(L)) is true
%
%condfin(L-list)
%condfin flow model(i)
%
%-----reverse:
%
%reverse([l1...ln],C)={[] , n=0
%                     {reverse([l2...ln],l1 U C), n>0
%
%reverse(L-list,R-list)
%reverse flow model(i,o)
%

%predicates used for solving the problem:
condition([],_).

condition([H|T],E):- H =\= E+1,
                     H =\= E-1,
                     condition(T,E).
conditionn([],_).
conditionn([H|T],E):- \+condition([H|T],E).


insert([],E,[E]).

insert([H|T],E,[E,H|T]).

insert([H|T],E,[H|TR]):- insert(T,E,TR).

perm([],[]).
perm([H|T],R):-perm(T,TR),
               insert(TR,H,R).


reverse([],C,C).
reverse([H|T],R,C):-reverse(T,R,[H|C]).

condfinaux([]).
condfinaux([H|T]):-conditionn(T,H),
                     condfinaux(T).

condfin(L):-reverse(L,R,[]),
            condfinaux(R).

solution(L,R):-perm(L,R),
               condfin(R).


teste:-findall(AU,solution([1,2,3],AU),[
                      [1,2,3],
                      [2,1,3],
                      [2,3,1],
                      [3,2,1]]),

       findall(AU,solution([1,2],AU),[
                      [1,2],
                      [2,1]]),

       findall(AU,solution([1,2,1],AU),[
                      [1,2,1],
                      [2,1,1],
                      [2,1,1],
                      [1,2,1]]).










%useless trial and error predicates:
comb(_,0,[]).
comb([H|T],K,[H|TR]):- K>0,
                       K1 is K-1,
                       comb(T,K1,TR).
comb([_|T],K,R):-K>0,
                 comb(T,K,R).


ffor([H|T],H,T).
ffor([H|T],R,[H|TR]):-ffor(T,R,TR).


for([H|_],H).
for([_|T],R):-for(T,R).

nalready([],_).
nalready([H|T],E):-H =\= E,
                 nalready(T,E).

combinari(_,0,[]).

combinari([H|T],K,[HR|TR]):- K>0,
                            K2 is K-1,
                            for([H|T],AU),
                            combinari([H|T],K2,TR),
                            nalready(TR,AU),
                            conditionn(TR,AU),
                            HR is AU.


aranjamente(L,K,RA):-comb(L,K,RC),
                     perm(RC,RA).






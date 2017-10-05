%%%-------------------------------------------------------------------
%%% @author Praveen Gupta
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. May 2017 01:21
%%%-------------------------------------------------------------------
-module(myList).
-author("Praveen Gupta").

%% API
-export([concat/2,last/1,belongs/2,sum/1,sort/1,
  delete/2,least/1,reverse/1,add_start/2,
  size/1,avg/1,star/1,pattern/1]).

%For appending 2 lists.
concat(X,Y)-> X++Y.

%For finding the last element of the List.
last(X)
% hd(lists:reverse(X)).
->last(hd(X),tl(X)).
last(H,[])->H;
last(_,T)->last(hd(T),tl(T)).


%For Checking if given Key exists in the List.
belongs(X,Key)  when   Key==hd(X)     ->  true;
belongs(X,Key) when     Key/=hd(X)   ,tl(X)/=[]       ->  belongs(tl(X),Key);
belongs(X,Key) when   Key/=hd(X)    ,  tl(X)==[]->false.


% For Sorting the given list.
  % Least function finds the minimum term.
least([H|T])->least(T,H).
least(X,M) when X==[]->M;
least(X,M)->
  if
    hd(X) < M ->
      least(tl(X),hd(X));
    true->
      least(tl(X),M)
  end.

  % Delete Function deletes the given value from a list and returns the new List.
delete(Key,X)->delete([],X,Key,X).
delete(H,[],_,_)->H;
delete(H,T,Key,X)->
  if
    hd(T)==Key -> H++tl(T);
    true ->
      delete(H++[hd(T)],tl(T),Key,X)
  end.

%Sort Function returns the Sorted List.
sort(X)->sort(X,[]).
sort([],Y)->Y;
sort(X,Y)->sort(delete(least(X),X),Y++[least(X)]).



%Sum funtion finds the Sum of elements of the given List.
sum(X)->sum(X,0).
sum([],S)->S;
sum(X,S) when X/=[] ->  sum(tl(X),S+hd(X)).

%For reversing the given list.
reverse(X)->reverse(X,[]).
reverse([],A) -> A;
%reverse(X,A)->reverse(tl(X),[hd(X)]++A).
reverse([H|T],A)->reverse(T,[H]++A).

%For appending an elemet at the start of the list.
add_start(X,Y)->[Y]++X.

%For finding the number of elements in a list.
size(X)->size(X,0).
size([],A)->A;
size(X,A)->size(tl(X),A+1).

%For finding the average value of the elements of the list.
avg(X)->sum(X)/ myList:size(X).

%For printing stars as per elements of a list.
pattern([])->io:format("~n");
pattern([H|T])->star(H),
  pattern(T).

%For printing the given number of stars.
star(X)->star(X,0).
star(X,X)->io:format("~n");
star(X,A) ->io:format("*"),
star(X,A+1).

%----------------------------------------------------------------------------------------------------------------%




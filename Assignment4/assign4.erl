%%%-------------------------------------------------------------------
%%% @author Praveen Gupta
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Jun 2017 01:08 PM
%%%-------------------------------------------------------------------
-module(assign4).
-author("Praveen Gupta").

%% API
-export([for/4, index/3, for_all/2, there_exists/2, there_exists2/2,
  foldl/2, foldl/3, foldr/2, foldr/3, filterl/2, filterr/2, scanl/2,
  scanl/3, scanr/2, scanr/3, rem_dupsl/1, rem_dupsr/1, qsort/1, sum_square/1,
  takewhile/2, exceed1000/0, size_subset/2]).

%For loop construct with Start value = I , Loop update = Update , Loop body = Body
for(I, Pred, Update, Body) ->
  case Pred(I) of
    true -> Body(I),
      for(Update(I), Pred, Update, Body);
    false -> ok
  end.

%Returns position of key in list.
index([H | T], Key, Pred) -> index([H | T], Key, Pred, 0).
index([], _, _, _) -> not_found;
index([H | T], Key, Pred, Pos) ->
  case Pred(H, Key) of
    true -> Pos;
    false -> index(T, Key, Pred, Pos + 1)
  end.

%Tells if all elements of List satisfy Pred.
for_all([H | T], Pred) ->
  case Pred(H) of
    true -> for_all(T, Pred);
    false -> false
  end;
for_all([], _) -> true.

%Tells if there exists an element in List satisfying Pred.
there_exists([H | T], Pred) ->
  case Pred(H) of
    true -> true;
    false -> there_exists(T, Pred)
  end;
there_exists([], _) -> false.

%Tells if there exists exactly 2 elements in List satisfying Pred.
there_exists2([H | T], Pred) -> there_exists2([H | T], Pred, 0).
there_exists2([], _, Count) -> Count == 2;
there_exists2([H | T], Pred, Count) ->
  case Pred(H) of
    true -> there_exists2(T, Pred, Count + 1);
    false -> there_exists2(T, Pred, Count)
  end.

%Accumulator operating from head to last.
foldl(F, [H | T]) -> foldl(F, H, T).
foldl(_, Key, []) -> Key;
foldl(F, Key, [H | T]) -> foldl(F, F(H, Key), T).

%Accumulator operating from last to head.
foldr(F, [H | T]) -> foldr(F, H, T).
foldr(_, Key, []) -> Key;
foldr(F, Key, [H | T]) ->
  F(H, foldr(F, Key, T)).

%Filter the list with Pred condition using foldl.
filterl(Pred, L) ->
  F = fun(X, Ans) ->
    case Pred(X) of
      true -> Ans ++ [X];
      false -> Ans
    end
      end,
  foldl(F, [], L).

%Filter the list with Pred condition using foldr.
filterr(Pred, L) ->
  F = fun(X, Ans) ->
    case Pred(X) of
      true -> Ans ++ [X];
      false -> Ans
    end
      end,
  foldr(F, [], L).

%Fold from head to last giving all intermediate states.
scanl(F, [H | T]) -> scanl(F, H, T).
scanl(_, Key, []) -> Key;
scanl(F, Key, [H | T]) ->
  case is_list(Key) of
    true -> scanl(F, Key ++ [F(H, lists:last(Key))], T);
    false -> scanl(F, [Key] ++ [F(H, Key)], T)
  end.

%Fold from last to head giving all intermediate states.
scanr(F, List) ->
  Last = lists:last(List), scanr(F, [Last], List--[Last]).
scanr(_, Key, []) -> Key;
scanr(F, Key, List) -> Last = lists:last(List),
  case is_list(Key) of
    true ->
      scanr(F, Key ++ [F(Last, lists:last(Key))], List--[Last]);
    false ->
      scanr(F, [Key] ++ [F(Last, Key)], List--[Last])
  end.

%Removes adjacent duplicate using foldl.
rem_dupsl([X]) -> [X];
rem_dupsl([H | T]) ->
  F = fun(X, Ans) ->
    case lists:last(Ans) =:= X of
      true -> Ans;
      false -> Ans ++ [X]
    end
      end,
  foldl(F, [H], T).

%Removes adjacent duplicate using foldlr.
rem_dupsr([X]) -> [X];
rem_dupsr([H | T]) ->
  F = fun(X, Ans) ->
    case hd(Ans) =:= X of
      true -> Ans;
      false -> [X] ++ Ans
    end
      end,
  foldr(F, [H], T).

%Quick Sort using filterl.
qsort([]) -> [];
qsort([H | T]) ->
  Fl = fun(X) -> X =< H
       end,
  Fr = fun(X) -> X > H
       end,
  qsort(filterl(Fl, T)) ++ [H] ++ qsort(filterl(Fr, T)).

%Sum of squares of elements which are even
%Goldbach Conjecture : Every even number greater than 2 can be expressed as a sum of 2 prime numbers.
sum_square(L) ->
  F = fun(X, Ans) ->
    case (X /= 2) of
      true -> Ans + math:pow(X, 2);
      false -> Ans
    end
      end,
  round(foldl(F, 0, L)).

%Returns the longest prefix of the list for which all elements satisfy the predicate.
takewhile(Pred, [H | T]) ->
  case Pred(H) of
    true -> [H] ++ takewhile(Pred, T);
    false -> []
  end;
takewhile(_, []) -> [].

%No of consecutive natural numbers for sum of the square roots to exceed 1000 using scanl and takewhile.
exceed1000() ->
  F1 = fun(X) -> X < 1000
       end,
  F2 = fun(X, Ans) ->
    Ans + math:sqrt(X)
       end,
  1 + length(takewhile(F1, scanl(F2, 1, lists:seq(2, 500)))).

%Size of minimum subset on List such that sum is >= S.
size_subset(List, S) ->
  case (lists:sum(List) < S) of
    true -> not_found;
    false -> F = fun(X, AnsList) ->
      case lists:sum(AnsList) >= S of
        true -> AnsList;
        false -> AnsList ++ [X]
      end
                 end,
      length(foldl(F, [], lists:reverse(lists:sort(List))))
  end.

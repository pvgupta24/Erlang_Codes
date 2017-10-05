%%%--------------------------------------------------------------------------
%%% @author Praveen Gupta
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Jul 2017 12:36 AM
%%%--------------------------------------------------------------------------
-module(assign5).
-author("Praveen Gupta").

%% API
-export([add/1, subtract/1, multiply/1, divide/1, greaterThanX/1,
  lessThanX/1, derive/2, integral/4, multiplyElements/2, filterGreaterThan/2,
  maxElement/1, sumElements/1, closestZero/1, myfoldl/2, foldl/2, foldr/2,
  add/2, subtract/2, multiply/2, divide/2, greaterThanX/2, lessThanX/2]).

%-----------------------------------------------------------------------------
% Q1
%Returns a function to add X with the parameter passed to the func i.e Y.
add(X) ->
  fun(Y) -> X + Y
  end.

%Returns X + Y using curried form of add.
add(X, Y) ->
  F = add(X),
  F(Y).

%Returns a function to subtract X from the parameter passed to the func i.e Y.
subtract(X) ->
  fun(Y) -> Y - X
  end.

%Returns X - Y using curried form of subtract.
subtract(X, Y) -> (subtract(Y))(X).

%Returns a function to multiply X with the parameter passed to the func i.e Y.
multiply(X) ->
  fun(Y) -> X * Y
  end.
%Returns X * Y using curried form of multiply.
multiply(X, Y) -> (multiply(X))(Y).


%Returns a function to divide the parameter passed to the func i.e Y with X.
divide(X) ->
  fun(Y) -> Y / X
  end.

%Returns X / Y using curried form of divide.
divide(X, Y) -> (divide(Y))(X).

%Returns a function which tells if the parameter passed to the func i.e Y is greater than X.
greaterThanX(X) ->
  fun(Y) -> Y > X
  end.

%Tells if X > Y using curried form of greaterThanX.
greaterThanX(X, Y) -> (greaterThanX(X))(Y).

%Returns a function which tells if the parameter passed to the func i.e Y is less than X.
lessThanX(X) ->
  fun(Y) -> Y < X
  end.

%Tells if X < Y using curried form of lessThanX.
lessThanX(X, Y) -> (lessThanX(X))(Y).

%--------------------------------------------------------------------------------------------

% Returns the two elements of list whose sum is closest to zero.
closestZero([H | T]) ->
  F = fun(X, [A, B]) ->
    case greaterThanX(abs(add(A,B)),abs(add(A,X))) of
      true -> [A, B];
      false -> [A, X]
    end end,
  loopClosestZero(F, [H, hd(T)], T).

loopClosestZero(_, [A, B], [_]) ->
  io:format("Closest to Zero : ( ~w ) + ( ~w ) = ~w ~n", [A, B, A + B]);
loopClosestZero(F, Acc, T) -> loopClosestZero(F, lists:foldl(F, Acc, T), tl(T)).

%Multiply each element of list L by N.
multiplyElements(L, N) ->
  F = multiply(N),
  lists:map(fun(X) -> F(X) end, L).

%Filter the list L to elements greater than N.
filterGreaterThan(L, N) ->
  F = greaterThanX(N),
  lists:filter(fun(X) -> F(X) end, L).

%Returns max element of List.
maxElement([H | T]) ->
  F = fun(X, Acc) ->
    case (greaterThanX(Acc))(X) of
      true -> X;
      false -> Acc
    end
      end,
  lists:foldl(F, H, T).

%Returns sum of elements of list L.
sumElements(L) ->
  F = fun(X, Acc) -> (add(Acc))(X) end,
  lists:foldl(F, 0, L).

%--------------------------------------------------------------------------------------------

%Returns a function that takes X as input, and gives the derivate of F given a given H.
derive(F, H) ->
  fun(X) -> (F(X + H) - F(X)) / H
  end.

%-------------------------------------------------------------------------------------------------------------------------%
%Returns the integral of F from A to B, using Simpson's rule.
integral(A, B, N, F) -> H = (B - A) / N,
  (H / 3) * (sum_Y(0, N, 0, F, A, H)).

sum_Y(N, N, Ans, F, A, H) -> Ans + F(A + N * H);
sum_Y(0, N, Ans, F, A, H) -> sum_Y(1, N, Ans + F(A), F, A, H);
sum_Y(X, N, Ans, F, A, H) ->
  if
    X rem 2 == 0 -> sum_Y(X + 1, N, Ans + 2 * F(A + X * H), F, A, H);
    true -> sum_Y(X + 1, N, Ans + 4 * F(A + X * H), F, A, H)
  end.

%-------------------------------------------------------------------------------------------------------------------------%

%foldl using foldr
foldl(F, [A, B]) -> lists:foldr(F, B, [A]);
foldl(F, L) -> F(foldl(F, lists:droplast(L)), lists:last(L)).

%foldl(F, X, L) ->  (lists:foldr(fun(X, G) -> fun(A) -> G(F(X, A)) end end, fun(X) -> X end, L))(X).

%Another implementaion of foldl using foldr.
myfoldl(_, [X]) -> X;
myfoldl(F, L) ->
  Once = foldFirstPair(F, L), myfoldl(F, [Once] ++ tl(tl(L))).

foldFirstPair(F, [A, B]) -> F(A, B);
foldFirstPair(F, L) ->
  Last = lists:last(L),
  Drop = lists:droplast(L),
  lists:foldr(fun(_, _) -> foldFirstPair(F, Drop) end, Last, Drop).

%-------------------------------------------------------------------------------------------------------------------------%

%foldr using foldl.
foldr(F, [A, B]) -> lists:foldl(F, A, [B]);
foldr(F, [H | T]) -> F(foldr(F, T), H).

%-------------------------------------------------------------------------------------------------------------------------%
%Though it seems that foldl consumes the list from the start, actually it runs backwards.
%f ( ... (f (f (f (f z x1) x2) x3) x4) ...) xn where f a b is f(a,b).
%And foldr consumes the list from the end.
%f x1 (f x2 (f x3 (f x4 ... (f xn z) ... )))  where f a b is f(a,b).
%foldl is tail recursive whereas foldr recurses into an arguement.
%As it is lazy,i.e result is not calculated until it is needed,
%therefore foldr sometimes works on infinite lists.

%Universal nature of foldr.

%foldr(_, V, []) -> V;
%foldr(f, V, [H|T]) -> f(H, foldr(f, V, T)).

%The universal property of fold is that you get a bi-implication between the two equations -> g (List) = fold(f,v,List).
%It means that there could be different ways to go through elements of the list and perform some operation
%but they all are in fact same and fold is at its root. Thus being universal in nature.

%-------------------------------------------------------------------------------------------------------------------------%
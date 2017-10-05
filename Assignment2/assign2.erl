
%%%-------------------------------------------------------------------
%%% @author Praveen Gupta
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. May 2017 09:21 PM
%%%-------------------------------------------------------------------
-module(assign2).
-author("Praveen Gupta").
%% API
-export([unique/1, uniq/1, freq/2, replicate/2, rep/2, reverse/1, zip/2, fac/1, fact/1,
  zipp/2, fib/1, fibb/1, fibTerm/1, fibTimer/0, bsort/1, isort/1, ssort/1, msort/1, merge/2, qsort/1, randList/1, sortTimer/0]).

%Takes a List and returns the list without repetition of elements.
unique(X) -> unique(X, []).
unique([], N) -> N;
unique([H | T], N) ->
  case lists:member(H, N) of
    true -> unique(T, N);
    false -> unique(T, N ++ [H])
  end.

%Takes  List and returns the list containing only unique elements.
uniq(X) -> [A || A <- X, freq(A, X) == 1].

%Takes a List and returns the count of an element in the list.
freq(_, []) -> 0;
freq(A, [H | T]) ->
  if
    A == H -> 1 + freq(A, T);
    true -> freq(A, T)
  end.

%Returns a list containing an element with desired repetions.
replicate(N, X) -> replicate(N, X, []).
replicate(0, _, A) -> A;
replicate(N, X, A) -> replicate(N - 1, X, A ++ [X]).

%Another approach for replicate.
rep(1, X) -> [X];
rep(N, X) -> rep(N - 1, X) ++ [X].

%Takes a list and returns its reverse list.
reverse(X) -> reverse(X, []).
reverse([], A) -> A;
reverse([H | T], A) -> reverse(T, [H] ++ A).

%Takes 2 list and returns a list with tuples of corresponding elements.
zip(X, Y) -> zip(X, Y, []).
zip([], _, A) -> A;
zip(_, [], A) -> A;
zip([XH | XT], [YH | YT], A) -> zip(XT, YT, A ++ [{XH, YH}]).

%Another approach for zip.
zipp([X | XT], [Y | YT]) -> [{X, Y} | zip(XT, YT)];
zipp([], []) -> [].

%Returns factorial of given no.
fac(0) -> 1;
fac(N) -> N * fac(N - 1).

%Another approach for factorial using tail recursion.
fact(N) -> fact(N, 1).
fact(0, F) -> F;
fact(N, F) -> fact(N - 1, F * N).
%Prints N elements of the fibonacci series.
%%
%%fibb(1) -> [1];
%%fibb(2) -> [1, 1];
%%fibb(N) -> fibb(N - 1) ++ [fibTerm(N)].

fibTerm(1) -> 1;
fibTerm(2) -> 1;
fibTerm(N) -> fibTerm(N - 1) + fibTerm(N - 2).

fibb(N) -> (fibb(N, 1, 0)).
fibb(1, A, B) -> [A + B];
fibb(N, A, B) -> C = A + B,
  [C] ++ fibb(N - 1, B, C).

%Prints N elements of the fibonacci series using tail recursion.
fib(N) ->
  case N of
    1 -> [1];
    2 -> [1, 1];
    _ -> reverse(fib(N, [1, 1]))
  end.
fib(2, A) -> A;
fib(N, A) -> fib(N - 1, [hd(A) + hd(tl(A))] ++ A).

%Gives time taken by the fibonacci functions.
fibTimer() -> fibTimer(1, true, true).
fibTimer(N, _, _) when N > 100000 -> io:format("Limit reached ~w>100000 .~n",[N]);
fibTimer(_, false, false) -> io:format("");
fibTimer(N, Tail, NonTail) ->
  if
    Tail -> {T1, _} = timer:tc(assign2, fib, [N]),
      if
        T1 > 60000000 -> io:format("Time limit(60 sec) exceeded with Tail Recursion for ~9w elements.~n", [N]),
          Tail2 = false;
        true -> io:format("~9w elements : ~f seconds with Tail Recursion.~n", [N, T1 / 1000000]),
          Tail2 = true
      end;
    true -> Tail2 = false
  end,
  if
    NonTail -> {T2, _} = timer:tc(assign2, fibb, [N]),
      if
        T2 > 60000000 -> io:format("Time limit(60 sec) exceeded without Tail Recursion for ~9w elements.~n", [N]),
          NonTail2 = false;
        true -> io:format("~9w elements : ~f seconds without Tail Recursion.~n", [N, T2 / 1000000]),
          NonTail2 = true
      end;
    true -> NonTail2 = false
  end,
  fibTimer(N * 2, Tail2, NonTail2).

%Sorts the given list using bubble sort algorithm.
bsort(List) -> bsort(List, [], []).
bsort([A | []], _, Sorted) -> [A] ++ Sorted;
bsort([A, B | []], Temp, Sorted) ->
  if
    A < B -> bsort(lists:droplast(Temp ++ [A, B]), [], [B] ++ Sorted);
    true -> bsort(lists:droplast(Temp ++ [B, A]), [], [A] ++ Sorted)
  end;
bsort([A, B | T], Temp, Sorted) ->
  if
    A < B -> bsort([B | T], Temp ++ [A], Sorted);
    true -> bsort([A | T], Temp ++ [B], Sorted)
  end.

%Sorts the given list using insertion sort algorithm.
isort(X) -> isort(X, []).
isort([], Y) -> Y;
isort(X, Y) -> Min = lists:min(X),
  isort(lists:delete(Min, X), Y ++ [Min]).

%Sorts the given list using selection sort algorithm.
ssort(List) -> ssort(List, List, []).
ssort([A | []], _, Sorted) -> [A] ++ Sorted;
ssort([A, B | []], Temp, Sorted) ->
  if
    A > B -> ssort(lists:delete(A, Temp), lists:delete(A, Temp), [A] ++ Sorted);
    true -> ssort(lists:delete(B, Temp), lists:delete(B, Temp), [B] ++ Sorted)
  end;
ssort([H | T], Temp, Sorted) ->
  Last = lists:last(T),
  if
    H < Last -> ssort(T, Temp, Sorted);
    true -> ssort(lists:droplast(T) ++ [H], Temp, Sorted)
  end.

%Sorts the given list using merge sort algorithm.
msort([]) -> [];
msort([H | []]) -> [H];
msort(X) -> {F, S} = lists:split(length(X) div 2, X),
  merge(msort(F), msort(S)).

%Merges 2 sorted lists into 1 sorted list
merge(X, []) -> X;
merge([], X) -> X;
merge([X | XT], [Y | YT]) ->
  if
    X < Y -> [X] ++ merge(XT, [Y | YT]);
    true -> [Y] ++ merge([X | XT], YT)
  end.

%Sorts the given list using quick sort algorithm.
qsort([]) -> [];
qsort([H | T]) -> qsort([X || X <- T, X =< H]) ++ [H] ++ qsort([X || X <- T, X > H]).

%Returns a list containing N random elements.
randList(N) -> randList(N, [], 0).
randList(N, X, N) -> X;
randList(N, X, A) -> randList(N, X ++ [rand:uniform(100)], A + 1).

%%mtimer() -> mtimer(1).
%%mtimer(N) when N > 10000000 -> io:format("Limit Exceeded ~w > 10000000~n", [N]);
%%mtimer(N) ->
%%  {T, _} = timer:tc(assign2, msort, [randList(N)]),
%%  io:format("~w elements took ~f seconds by mergesort~n", [N, T / 1000000]),
%%  if
%%    T >= 60000000 -> io:format("Time Limit Exceeded for ~w elements~n", [N]);
%%    true ->
%%      mtimer(N * 10)
%%  end.

%Gives the sorting time for the different search algorithms
sortTimer() -> sortTimer(1, true, true, true, true, true).
sortTimer(N, _, _, _, _, _) when N > 10000000 -> io:format("Limit Exceeded ~w > 10000000~n", [N]);
sortTimer(N, M, Q, I, B, S) -> X = randList(N),
  if
    M -> {Tm, _} = timer:tc(assign2, msort, [X]),
      if
        Tm >= 60000000 -> io:format("Time Limit Exceeded for ~w elements for merge sort~n", [N]), M2 = false;
        true -> io:format("~8w elements : ~f seconds by merge sort~n", [N, Tm / 1000000]), M2 = true
      end;
    true ->
      %io:format("Time Limit Exceeded for ~w elements for merge sort~n", [N]),
      M2 = false
  end,
  if
    Q -> {Tq, _} = timer:tc(assign2, qsort, [X]),
      if
        Tq >= 60000000 -> io:format("Time Limit(60s) Exceeded for ~w elements for quick sort~n", [N]), Q2 = false;
        true -> io:format("~8w elements : ~f seconds by quick sort~n", [N, Tq / 1000000]), Q2 = true
      end;
    true ->
      %io:format("Time Limit Exceeded for ~w elements for quick sort~n", [N]),
      Q2 = false
  end,
  if
    I -> {Ti, _} = timer:tc(assign2, isort, [X]),
      if
        Ti >= 60000000 -> io:format("Time Limit(60s) Exceeded for ~w elements for insertion sort~n", [N]), I2 = false;
        true -> io:format("~8w elements : ~f seconds by insertion sort~n", [N, Ti / 1000000]), I2 = true
      end;
    true ->
      %io:format("Time Limit Exceeded for ~w elements for insertion sort~n", [N]),
      I2 = false
  end,
  if
    B -> {Tb, _} = timer:tc(assign2, bsort, [X]),
      if
        Tb >= 60000000 -> io:format("Time Limit(60s) Exceeded for ~w elements for bubble sort~n", [N]), B2 = false;
        true -> io:format("~8w elements : ~f seconds by bubble sort~n", [N, Tb / 1000000]), B2 = true
      end;
    true ->
      %io:format("Time Limit Exceeded for ~w elements for bubble sort~n", [N]),
      B2 = false
  end,
  if
    S -> {Ts, _} = timer:tc(assign2, ssort, [X]),
      if
        Ts >= 60000000 -> io:format("Time Limit(60s) Exceeded for ~w elements for selection sort~n", [N]), S2 = false;
        true -> io:format("~8w elements : ~f seconds by selection sort~n", [N, Ts / 1000000]), S2 = true
      end;
    true ->
      %io:format("Time Limit Exceeded for ~w elements for selection sort~n", [N]),
      S2 = false
  end,
  sortTimer(N * 10, M2, Q2, I2, B2, S2).

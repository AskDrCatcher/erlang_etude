-module(stats).
-export([minimum/1,maximum/1, range/1, mean/1, stdv/1]).

minimum([H | T]) ->
    minimum(T, H).


minimum([], A) -> A;
minimum([H | T], A) -> 
    if 
        H < A  -> minimum(T, H);
        H >= A -> minimum(T, A)
    end.

maximum([H | T]) ->
    maximum(T, H).

maximum([], A) -> A;
maximum([H | T], A) ->
    if 
        H > A  -> maximum(T, H);
        H =< A -> maximum(T, A)
    end.

range(ListOfNum) ->
    [minimum(ListOfNum), maximum(ListOfNum)].


mean(L) ->
   Sum = lists:foldl(fun(X, Sum) -> X + Sum end, 0, L),
   Sum / length(L).

stdv (L) ->
   {Sum, SumOfSquare} = 
   lists:foldl(fun(X, {Sum, _SumOfSquare}) ->
                    {X + Sum, math:pow(X, 2) + Sum} 
                end, {0, 0}, L),
    N = length(L),
    NSumOfSquare = N * SumOfSquare,
    SumSum = Sum * Sum,
    math:sqrt(erlang:abs((NSumOfSquare - SumSum) / (N * (N - 1)))).



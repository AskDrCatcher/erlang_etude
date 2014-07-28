-module(stats).
-export([minimum/1,maximum/1, range/1]).

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




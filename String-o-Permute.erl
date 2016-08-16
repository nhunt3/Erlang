-module(solution).
-export([main/0]).

colLoop(List) -> lists:reverse(colLoop(List,[])).

colLoop([],Result) -> Result;
colLoop([A,B|Tail],Result) ->
    colLoop(Tail,[A,B|Result]).

rowLoop(0) -> ok;
rowLoop(R) ->
  {ok,[X]} = io:fread("","~s"),
  io:format("~s~n", [colLoop(X)]),
  rowLoop(R-1).

main() ->
    {ok, [X]} = io:fread("", "~d"),
    rowLoop(X).
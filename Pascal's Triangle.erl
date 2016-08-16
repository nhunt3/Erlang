-module(solution).
-export([main/0]).

fact(N) -> fact(N, 1).
% tail recursive factorial function
fact(0, Acc) -> Acc;
fact(N, Acc) -> fact(N-1, N*Acc).

colsLoop(Cur, C) when Cur > C -> ok;
colsLoop(Cur, C) ->
  io:format("~p ",[round(fact(C)/(fact(Cur)*fact(C-Cur)))]),
  colsLoop(Cur+1, C).

rowsLoop(S, N) when S == N ->
    colsLoop(0, S);
rowsLoop(S, N) ->
    colsLoop(0, S),
    io:format("~n"),
    rowsLoop(S+1, N).

main() ->
    {ok, [Y]} = io:fread("", "~d"),
    rowsLoop(0, Y-1).
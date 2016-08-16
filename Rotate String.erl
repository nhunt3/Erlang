-module(solution).
-export([main/0]).

createCombos(L) -> createCombos(L, L).

createCombos(_, []) -> ok;
createCombos([H|T], [_|R]) ->
    L = T ++ [H],
    io:fwrite(L ++ " "),
    createCombos(L, R).

rowLoop() ->
    case io:fread("", "~s") of
        eof -> ok;
        {ok, [L]} ->
            createCombos(L),
            io:fwrite("\n"),
            rowLoop()
    end.

main() ->
    io:fread("", "~s"), % dummy line
    rowLoop().
-module(solution).
-export([main/0]).

checkCount(Y,H,C,S,TF,L) when C >= Y, TF == false ->
    {sets:add_element(H, S), [H|L]};
checkCount(_,_,_,S,_,L) ->
    {S, L}.

buildDict(D,[]) -> D;
buildDict(D,[HL|T]) ->
    H = lists:flatten([HL]),   
    D1 = dict:update_counter(H, 1, D),
    buildDict(D1,T).

buildList(_, L, _, _, []) -> L;
buildList(S, L, Y, D, [HL|T]) ->
    H = lists:flatten([HL]),
    C = dict:fetch(H, D),
    TF = sets:is_element(H, S),
    {Snew, Lnew} = checkCount(Y,H,C,S,TF,L),
    buildList(Snew, Lnew, Y, D, T).

print([]) ->
    io:fwrite("-1");
print(L) ->
    io:fwrite(lists:join(" ", lists:reverse(L))).

rowLoop() ->
    case io:fread("", "~s") of
        eof -> ok;
        {ok, [_]} ->
            {ok, [Y]} = io:fread("", "~s"),
            Z = io:get_line(""),
            D = dict:new(),
            S = sets:new(),
            Z1 = re:replace(Z, "\n", ""),
            Z2 = re:split(Z1, " "),
            Y1 = list_to_integer(Y),
            D1 = buildDict(D, Z2),
            L1 = buildList(S, [], Y1, D1, Z2),
            print(L1),
            io:fwrite("\n"),
            rowLoop()
    end.

main() ->
    io:fread("", "~s"), % dummy line
    rowLoop().

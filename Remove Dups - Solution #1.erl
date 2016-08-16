-module(solution).
-export([main/0]).

checkIfInList(H, TF, S, L) when TF == false ->
    {sets:add_element(H, S), [H|L]};
checkIfInList(_, _, S, L) ->
    {S, L}.

colLoop([], _, L) -> io:fwrite(lists:reverse(L));
colLoop([H|T], S, NL) ->
    TF = sets:is_element(H, S),
    {Snew, NLnew} = checkIfInList(H, TF, S, NL),
    colLoop(T, Snew, NLnew).

main() ->
    {ok, [L]} = io:fread("", "~s"),
    colLoop(L, sets:new(), []).

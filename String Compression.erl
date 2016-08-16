-module(solution).
-export([main/0]).

zip(S) -> zip(S, 0, []).

zip([], _, Agg) ->
    io:fwrite(lists:reverse(Agg));
zip([H,H|T], Count, Agg) ->
    zip([H|T], Count+1, Agg);
zip([H|T], 0, Agg) ->
    zip(T, 0, [H|Agg]);
zip([H|T], Count, Agg) ->
    zip(T, 0, [integer_to_list(Count+1), H | Agg]).

main() ->
    {ok, [S]} = io:fread("","~s"),
    zip(S).

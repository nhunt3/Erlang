-module(solution).
-export([main/0]).

unique(_, [], Acc) -> io:format("~s", [lists:reverse(Acc)]);
unique(Set, [H|T], Acc) ->
    case sets:is_element(H, Set) of  
        true ->
            unique(Set, T, Acc);
        false ->
            Snew = sets:add_element(H, Set),
            unique(Snew, T, [H|Acc])
    end.                                      

main() ->
	{ok, [List]} = io:fread("","~s"),
    Set = sets:new(),
    unique(Set, List, [])
    .
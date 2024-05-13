:- ensure_loaded(operators).


_ :: agenda(respond(booleanQuestion(extraverted))).

getLatestMove :: (heard(Move) ->
		      [non_integrated_move(Move),
		       latest_move(Move)]).

selectAssert :: ([agenda(respond(Q)),
		  ^P,
		  $relevant_answer(Q, P)] ->
		     utter(assert(P))).


relevant_answer(Q, not(P)) :-
    relevant_answer(Q, P).

relevant_answer(booleanQuestion(Pred), Pred).

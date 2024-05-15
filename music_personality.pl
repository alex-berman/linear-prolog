:- ensure_loaded(operators).


_ :: agenda(respond(booleanQuestion(extraverted))).

getLatestMove :: (heard(Move) ->
		      [non_integrated_move(Move),
		       latest_move(Move)]).

integrateUserAsk :: (non_integrated_move(ask(Q)) ->
			 [qud(Q),
			  agenda(respond(Q))]).

getExplanans :: ([^agenda(respond(why(Explanandum))),
		  ^supports(Explanans, Explanandum),
		  \+explanans(Explanans)] ->
		     explanans(Explanans)).

assertRelevantAnswer :: ([agenda(respond(Q)),
			  ^P,
			  $relevant_answer(Q, P)] ->
			     utter(assert(P))).


relevant_answer(Q, not(P)) :-
    relevant_answer(Q, P).

relevant_answer(booleanQuestion(Pred), Pred).

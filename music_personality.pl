:- ensure_loaded(operators).


_ :: agenda(respond(booleanQuestion(extraverted))).

getLatestMove :: (heard(Move) ->
		      [non_integrated_move(Move),
		       latest_move(Move)]).

integrateUserAsk :: (non_integrated_move(ask(Q)) ->
			 [qud(Q),
			  agenda(respond(Q))]).

resolveWhyQuestionEllipsis :: ([agenda(respond(why(P))),
				$var(P),
				^previous_system_move(assert(Q))] ->
				   agenda(respond(why(Q)))).

answerEhtymematically :: ([agenda(respond(why(Explanandum))),
			   ^supports(Explanans, Explanandum)] ->
			      next_system_move(assert(Explanandum))).

assertRelevantAnswer :: ([agenda(respond(Q)),
			  ^P,
			  $relevant_answer(Q, P)] ->
			     next_system_move(assert(P))).

utterAndRemember :: (next_system_move(M) ->
			 [utter(M),
			  previous_system_move(M)]).


relevant_answer(Q, not(P)) :-
    relevant_answer(Q, P).

relevant_answer(booleanQuestion(Pred), Pred).

:- ensure_loaded(operators).
:- use_module(coverage_testing).


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


test :-
    test_coverage('test/dialog_coverage_music_personality').

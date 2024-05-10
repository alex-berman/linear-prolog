:- module(coverage_testing, [test_coverage/1]).
:- use_module(engine).

test_coverage(Path) :-
    ensure_loaded(Path),
    forall(test(Turns),
      (assert_initial_facts, test_turns(Turns))),
    write('OK\n').


test_turns([]) :- !.

test_turns(Turns) :-
    ExpectedFormat = [heard(UserMove, user, system), utter(ExpectedSystemMove, system, user)|TurnsTail],
    copy_term(ExpectedFormat, NonUnifiedExpectedFormat),
    ( Turns = ExpectedFormat ->
	  test_turn(UserMove, ExpectedSystemMove),
	  test_turns(TurnsTail)
     ; throw(error(type_error(NonUnifiedExpectedFormat, Turns)))
    ).


test_turn(UserMove, ExpectedSystemMove) :-
    assert(engine:fact(heard(UserMove, user, system))),
    apply_rules_exhaustively,
    ( engine:fact(utter(ActualSystemMove, system, user)) ->
      (ActualSystemMove = ExpectedSystemMove ->
	   retract(engine:fact(utter(ExpectedSystemMove, system, user)))
      ;
      write('Expected '), write(ExpectedSystemMove), write(' but got '), write(ActualSystemMove), nl
      )
    ;
    write('Expected '), write(ExpectedSystemMove), write(' but did not get any system move'), nl ).

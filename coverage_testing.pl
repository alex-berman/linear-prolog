:- module(coverage_testing, [test_coverage/1]).
:- use_module(engine).

test_coverage(Path) :-
    ensure_loaded(Path),
    forall(test(Facts, Turns), run_test(Facts, Turns)),
    write('OK\n').

run_test(Facts, Turns) :-
    assert_initial_facts,
    forall(member(Fact, Facts), assert(engine:fact(Fact))),
    test_turns(Turns).

test_turns([]) :- !.

test_turns([Turn|TurnsTail]) :-
    test_turn(Turn),
    test_turns(TurnsTail).

test_turn(utter(ExpectedSystemMove)) :-
    apply_rules_exhaustively,
    !,
    ( engine:fact(utter(ActualSystemMove)) ->
      (ActualSystemMove = ExpectedSystemMove ->
	   retract(engine:fact(utter(ExpectedSystemMove)))
      ;
      write('Expected '), write(ExpectedSystemMove), write(' but got '), write(ActualSystemMove), nl,
      fail
      )
     ;
     write('Expected '), write(ExpectedSystemMove), write(' but did not get any system move'), nl, fail
    ).

test_turn(heard(UserMove)) :-
    assert(engine:fact(heard(UserMove))).

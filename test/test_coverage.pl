:- use_module(library(readutil), [read_file_to_terms/3]).
:- use_module(engine).

test_coverage(DialogPath, TestPath) :-
    ensure_loaded(DialogPath),
    read_file_to_terms(TestPath, Tests, []),
    forall(member(Test, Tests), run_test(Test)),
    write('OK\n').

run_test(Test) :-
    ( is_dict(Test, TestName) ->
	  write('\nRunning test '), write(TestName), nl, nl,
	  clear_facts,
	  assert_initial_facts,
	  forall(member(Fact, Test.facts), assert(engine:fact(Fact))),
	  test_turns(Test.turns)
     ; write('Expected a dict but got '), write(Test), nl, fail ).

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

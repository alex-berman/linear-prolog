:- dynamic fact/2.

initial(start).
initial(has_turn(user)).
initial(moves([])).
initial(qud([])).

rule(start,
     start -> heard(ask(question(user, road, R, pick(route, R, home))), user, system)).

rule(hearAndRemember,
     [heard(M, X, Y),
      moves(Ms),
      has_turn(X)] ->
	 [moves([M|Ms]),
	  pending(M),
	  has_turn(Y)]).


run :-
    assert_initial_facts,
    repeat,
    print_state,
    ( bagof(rule(RuleName, (Antecedent -> Consequent)),
	  (rule(RuleName, (Antecedent -> Consequent)), antecedent_holds(Antecedent)),
	  ApplicableRules) ->
	  forall(member(rule(RuleName, (Antecedent -> Consequent)), ApplicableRules),
		 (
		     consume(Antecedent),
		     establish(Consequent),
		     write('Applied: '), write(RuleName), nl
		 )),
	  fail
     ; true ).

assert_initial_facts :-
    forall(initial(Proposition), assert(fact(Proposition))).

print_state :-
    write('-------------------\nState:\n'),
    forall(fact(Fact), (write('  '), write(Fact), nl)),
    nl.

antecedent_holds(Antecedent) :-
    fact(Antecedent).
antecedent_holds([Head|Tail]) :-
    antecedent_holds(Head),
    antecedent_holds(Tail).
antecedent_holds([]).

consume([]) :- !.
consume([Head|Tail]) :-
    !,
    consume(Head),
    consume(Tail).
consume(Proposition) :-
    retract(fact(Proposition)).

establish([]) :- !.
establish([Head|Tail]) :-
    !,
    establish(Head),
    establish(Tail).
establish(Proposition) :-
    assert(fact(Proposition)).

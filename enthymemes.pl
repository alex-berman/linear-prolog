:- dynamic fact/2.

initial(start).
initial(has_turn(user)).
initial(moves([])).
initial(qud([])).

rule(start,
     start -> heard(ask(question(user, road, R, pick(route, R, home))), user, system)).

rule(hearAndRemember,
     heard(M, X, Y) ->
	 moves(Ms) ->
	     has_turn(X) ->
		 [moves([M|Ms]),
		  pending(M),
		  has_turn(Y)]).


run :-
    assert_initial_facts,
    try_apply_rule.

assert_initial_facts :-
    forall(initial(Proposition), assert(fact(Proposition))).

try_apply_rule :-
    rule(_RuleName, (Antecedent -> Consequent)),
    fact(Antecedent),
    retract(fact(Antecedent)),
    assert(fact(Consequent)).

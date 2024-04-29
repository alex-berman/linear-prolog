:- use_module(engine).

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

:- use_module(engine).
:- ensure_loaded(operators).

initial(start).
initial(has_turn(user)).
initial(moves([])).
initial(qud([])).

start :: (start -> heard(ask(question(user, road, R, pick(route, R, home))), user, system)).

hearnAdRemember :: ([heard(M, X, Y),
		     moves(Ms),
		     has_turn(X)] ->
			[moves([M|Ms]),
			 pending(M),
			 has_turn(Y)]).

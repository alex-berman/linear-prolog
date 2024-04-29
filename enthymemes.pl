:- use_module(engine).
:- ensure_loaded(operators).

initial(start).
initial(has_turn(user)).
initial(moves([])).
initial(qud([])).

start :: (start -> heard(ask(question(user, road, R, pick(route, R, home))), user, system)).

hearAndRemember :: ([heard(M, X, Y),
		     moves(Ms),
		     has_turn(X)] ->
			[moves([M|Ms]),
			 pending(M, X, Y),
			 has_turn(Y)]).

pushQUD :: ([pending(ask(Q), _, _),
	     qud(Qs)] ->
		qud([Q|Qs])).

:- use_module(engine).
:- ensure_loaded(operators).

_ :: start.
start :: (start -> heard(ask(question(user, road, R, pick(route, R, home))), user, system)).

% initial state
ready :: has_turn(user).
noMoves :: moves([]).
noQud :: qud([]).


hearAndRemember :: ([heard(M, X, Y),
		     moves(Ms),
		     has_turn(X)] ->
			[moves([M|Ms]),
			 pending(M, X, Y),
			 has_turn(Y)]).

pushQUD :: ([pending(ask(Q), _, _),
	     qud(Qs)] ->
		qud([Q|Qs])).

:- use_module(engine).
:- ensure_loaded(operators).

_ :: start.
start :: (start -> heard(ask(question(user, road, R, pick(route(R, home)))), user, system)).

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


produceAnswerShort :: ([qud([question(user, A, X, P)|Qs]),
			^P] ->
			   [agenda(shortAnswer(A, X, system, user)),
			    qud(Qs),
			    answered(question(user, A, X, P))]).


% === DOMAIN KNOWLEDGE ===

% knowledge base	
d1 :: route(bypass, home).
d2 :: route(parkLane, home).
d3 :: route(bridgeRoute, home).
r1 :: shortest(route(bypass, home)).
r2 :: cheapest(route(parkLane, home)).
r3 :: prettiest(route(bridgeRoute, home)).

toposShorter :: ([^qud([question(user, road, X, pick(route(X, Y)))|_]),
		  route(X, Y),
		  ^shortest(route(X, Y))] ->
		     [pick(route(X, Y)),
		      topos(shortest(route, X, Y)),
		      enthymeme(shortest, pickRoute(X, Y))]).

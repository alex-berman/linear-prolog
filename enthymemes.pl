:- ensure_loaded(operators).

% initial state
ready :: hasTurn(user).
noMoves :: moves([]).
noQud :: qud([]).


utterAndRemember :: ([agenda(M),
		      moves(Ms),
		      hasTurn(system)] ->
			 [utter(M),
			  moves([M|Ms]),
			  hasTurn(user)]).

hearAndRemember :: ([heard(M),
		     moves(Ms),
		     hasTurn(user)] ->
			[moves([M|Ms]),
			 pending(M),
			 hasTurn(system)]).

pushQUD :: ([pending(ask(Q)),
	     qud(Qs)] ->
		qud([Q|Qs])).


produceAnswerShort :: ([qud([question(user, A, X, P)|Qs]),
			^P] ->
			   [agenda(shortAnswer(A, X)),
			    qud(Qs),
			    answered(question(user, A, X, P))]).


% === DOMAIN KNOWLEDGE ===

toposShorter :: ([^qud([question(user, road, X, pick(route(X, Y)))|_]),
		  route(X, Y),
		  ^shortest(route(X, Y))] ->
		     [pick(route(X, Y)),
		      topos(shortest(route, X, Y)),
		      enthymeme(shortest, pickRoute(X, Y))]).

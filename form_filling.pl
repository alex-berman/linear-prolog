:- use_module(engine).
:- ensure_loaded(operators).

% simulating user moves
start :: heard(greet, user, system).
q1 :: (utter(counterGreet, system, user) ->
	   heard(ask(question(user, time, T, tt(_, T, gotaplatsen, _))), user, system)).
q2b :: (utter(ask(question(system, bus, N0, wantBus(N0))), system, user) ->
	    heard(assert(wantBus(b55)), user, system)).


% initial state
ready :: hasTurn(user).
noMoves :: moves([]).
noQud :: qud([]).


utterAndRemember :: ([agenda(M, X, Y),
		      moves(Ms),
		      hasTurn(X)] ->
			 [utter(M, X, Y),
			  moves([(M, X, Y)|Ms]),
			  hasTurn(Y)]).

hearAndRemember :: ([heard(M, X, Y),
		     moves(Ms),
		     hasTurn(X)] ->
			[moves([M|Ms]),
			 pending(M, X, Y),
			 hasTurn(Y)]).

counterGreeting :: ([^hasTurn(X),
		     pending(greet, Y, X)] ->
			[agenda(counterGreet, X, Y)]).

processAssert :: ([pending(assert(P), DP1, DP),
		   qud([question(DP, A, X, P)|Qs])] ->
		      [userFact(P),
		       qud(Qs)]).

pushQUD :: ([pending(ask(Q), _, _),
	     qud(Qs)] ->
		qud([Q|Qs])).

produceCR :: ([^qud([question(user, _, _, P)|_]),
	       ?P] -> cr).


% === DOMAIN KNOWLEDGE ===

% knowledge base 1 (no CR)
kb1 :: tt(b18, t15, gotaplatsen,     johanneberg).
kb2 :: tt(b55, t20, gotaplatsen,     sciencePark).

specificCR :: ([cr,
		qud([question(user, time, T, tt(N, T, S, D))|Qs])] ->
		   [qud([question(system, bus, N, wantBus(N)),
			 question(user, time, T, tt(N, T, S, D))|Qs]),
		    agenda(ask(question(system, bus, N, wantBus(N))), system, user)]).


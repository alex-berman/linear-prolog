:- ensure_loaded(operators).
:- use_module(coverage_testing).

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

counterGreeting :: ([^hasTurn(system),
		     pending(greet)] ->
			[agenda(counterGreet)]).

processAssert :: ([pending(assert(P)),
		   qud([question(system, _, _, P)|Qs])] ->
		      [userFact(P),
		       qud(Qs)]).

pushQUD :: ([pending(ask(Q)),
	     qud(Qs)] ->
		qud([Q|Qs])).

produceAnswer :: ([qud([question(user, A, X, P)|Qs]),
		   !P] ->
		      [agenda(shortAnswer(A, X)),
		       qud(Qs),
		       answered(question(user, A, X, P))]).

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
		    agenda(ask(question(system, bus, N, wantBus(N))))]).


test :-
    test_coverage('test/dialog_coverage_form_filling').

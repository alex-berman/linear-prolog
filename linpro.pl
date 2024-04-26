:- dynamic has_turn/1, moves/1, qud/1, heard/3.

set(Proposition) :-
    Proposition =.. [Pred|_],
    RetractableHead =.. [Pred|_],
    retractall(RetractableHead),
    assert(Proposition).

initialize_state :-
    set(has_turn(user)),
    set(moves([])),
    set(qud([])),
    set(heard(ask(question(user, road, R, pick(route, R, home)) user system))).


:- initialize_state.

:- module(library, [run/0]).
:- ensure_loaded(operators).

:- dynamic fact/2.

run :-
    assert_initial_facts,
    print_state,
    repeat,
    ( bagof(RuleName :: (Antecedent -> Consequent),
	  (RuleName :: (Antecedent -> Consequent), antecedent_holds(Antecedent)),
	  ApplicableRules) ->
	  forall(member(RuleName :: (Antecedent -> Consequent), ApplicableRules),
		 (
		     consume(Antecedent),
		     establish(Consequent),
		     write('Applied: '), write(RuleName), nl,
		     print_state
		 )),
	  fail
     ; true ).

assert_initial_facts :-
    forall((_ :: Term, Term \= (_ -> _)),
	   assert(fact(Term))).

print_state :-
    write('-------------------\nState:\n'),
    forall(fact(Fact), (write('  '), write(Fact), nl)),
    nl.

antecedent_holds([]) :- !.
antecedent_holds([Head|Tail]) :-
    !,
    antecedent_holds(Head),
    antecedent_holds(Tail).
antecedent_holds(^Proposition) :- % premise is to be reproduced (corresponds to -* in ProLin)
    !,
    fact(Proposition).
antecedent_holds(?Proposition) :- % check if proposition is non-unique (roughly corresponds to ?-> in ProLin)
    !,
    setof(Proposition, fact(Proposition), Solutions),
    length(Solutions, N),
    N >= 2.
antecedent_holds(!Proposition) :- % check if proposition is unique (roughly corresponds to !-> in ProLin)
    !,
    setof(Proposition, fact(Proposition), Solutions),
    length(Solutions, N),
    N == 1,
    Solutions = [Proposition]. % unify with the unique solution
antecedent_holds(Proposition) :-
    fact(Proposition).

consume([]) :- !.
consume([Head|Tail]) :-
    !,
    consume(Head),
    consume(Tail).
consume(^_) :- !. % don't consume premises that are reproduced
consume(?_) :- !. % don't consume content of non-uniqueness test
consume(!_) :- !. % don't consume content of uniqueness test
consume(Proposition) :-
    retract(fact(Proposition)).

establish([]) :- !.
establish([Head|Tail]) :-
    !,
    establish(Head),
    establish(Tail).
establish(Proposition) :-
    assert(fact(Proposition)).

no_clarification_needed{
	facts:[
	    tt(b55, t20, gotaplatsen, sciencePark)
	],
	turns:[
	    heard(greet),
	    utter(counterGreet),
	    heard(ask(question(user, time, T, tt(_, T, gotaplatsen, _)))),
	    utter(shortAnswer(time, t20))
	]
    }.

clarification{
	facts:[
	    tt(b18, t15, gotaplatsen, johanneberg),
	    tt(b55, t20, gotaplatsen, sciencePark)
	],
	turns:[
	    heard(greet),
	    utter(counterGreet),
	    heard(ask(question(user, time, T, tt(_, T, gotaplatsen, _)))),
	    utter(ask(question(system, bus, N0, wantBus(N0)))),
	    heard(assert(wantBus(b55))),
	    utter(shortAnswer(time, t20))
	]
    }.

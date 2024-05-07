test([heard(greet, user, system),
      utter(counterGreet, system, user),
      heard(ask(question(user, time, T, tt(_, T, gotaplatsen, _))), user, system),
      utter(ask(question(system, bus, N0, wantBus(N0))), system, user),
      heard(assert(wantBus(b55)), user, system),
      utter(shortAnswer(time,t20),system,user)]).

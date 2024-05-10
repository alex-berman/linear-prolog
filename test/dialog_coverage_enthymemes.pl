test([heard(ask(question(user, road, R, pick(route(R, home))))),
      utter(shortAnswer(road, bypass)),
      heard(ask(question(user, reason, T, topos(T)))),
      utter(shortAnswer(reason,shortest(route,bypass,home)))]).

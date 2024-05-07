test([heard(ask(question(user, road, R, pick(route(R, home)))), user, system),
      utter(shortAnswer(road, bypass), system, user),
      heard(ask(question(user, reason, T, topos(T))), user, system),
      utter(shortAnswer(reason,shortest(route,bypass,home)), system, user)]).


test([route(bypass, home),
      route(parkLane, home),
      route(bridgeRoute, home),
      shortest(route(bypass, home)),
      cheapest(route(parkLane, home)),
      prettiest(route(bridgeRoute, home))],

     [heard(ask(question(user, road, R, pick(route(R, home))))),
      utter(shortAnswer(road, bypass)),
      heard(ask(question(user, reason, T, topos(T)))),
      utter(shortAnswer(reason,shortest(route,bypass,home)))]
    ).

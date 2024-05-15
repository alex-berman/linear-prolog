prediction_introverted{
	facts: [not(extraverted)],
	turns: [utter(assert(not(extraverted)))]
    }.

explanation_for_prediction{
	facts: [
	    not(extraverted),
	    not(high_value(danceability_mean)),
	    supports(not(high_value(danceability_mean)), not(extraverted))
	],
	turns: [
	    utter(assert(not(extraverted))),
	    heard(ask(why(_))),
	    utter(assert(not(high_value(danceability_mean))))
	]
    }.

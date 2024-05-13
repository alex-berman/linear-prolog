# Linear Prolog for Dialogue Management

This repository contains a framework for dialogue management based on linear logic and implemented in Prolog. The ideas underpinning the framework are outlined in the paper [Vladislav Maraev, Jean-Philippe Bernardy, Jonathan Ginzburg "Dialogue management with linear logic: the role of metavariables in questions and clarifications" (2020), Traitement Automatique des Langues, Volume 61, Numéro 3 : Dialogue et systèmes de dialogue](https://aclanthology.org/2020.tal-3.3/).

The code is inspired by, and adapts examples from, the Haskell-based implementation [ProLin](https://github.com/GU-CLASP/ProLin).

Requirements: SWI Prolog

## Example
`swipl -t 'test_coverage(form_filling, test/dialog_coverage_form_filling)' test/test_coverage.pl`

should produce output akin to:

```
Applied: hearAndRemember
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([greet])
  pending(greet,user,system)
  hasTurn(system)

Applied: counterGreeting
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([greet])
  hasTurn(system)
  agenda(counterGreet,system,user)

Applied: utterAndRemember
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  utter(counterGreet,system,user)
  moves([(counterGreet,system,user),greet])
  hasTurn(user)

Applied: hearAndRemember
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_17846,tt(_17852,_17846,gotaplatsen,_17858))),(counterGreet,system,user),greet])
  pending(ask(question(user,time,_17844,tt(_17850,_17844,gotaplatsen,_17856))),user,system)
  hasTurn(system)

Applied: pushQUD
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_17938,tt(_17944,_17938,gotaplatsen,_17950))),(counterGreet,system,user),greet])
  hasTurn(system)
  qud([question(user,time,_17934,tt(_17940,_17934,gotaplatsen,_17946))])

Applied: produceCR
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_18106,tt(_18112,_18106,gotaplatsen,_18118))),(counterGreet,system,user),greet])
  hasTurn(system)
  qud([question(user,time,_18102,tt(_18108,_18102,gotaplatsen,_18114))])
  cr

Applied: specificCR
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_18166,tt(_18172,_18166,gotaplatsen,_18178))),(counterGreet,system,user),greet])
  hasTurn(system)
  qud([question(system,bus,_18162,wantBus(_18162)),question(user,time,_18182,tt(_18162,_18182,gotaplatsen,_18194))])
  agenda(ask(question(system,bus,_18164,wantBus(_18164))),system,user)

Applied: utterAndRemember
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  qud([question(system,bus,_17858,wantBus(_17858)),question(user,time,_17878,tt(_17858,_17878,gotaplatsen,_17890))])
  utter(ask(question(system,bus,_17860,wantBus(_17860))),system,user)
  moves([(ask(question(system,bus,_17868,wantBus(_17868))),system,user),ask(question(user,time,_17898,tt(_17904,_17898,gotaplatsen,_17910))),(counterGreet,system,user),greet])
  hasTurn(user)

Applied: hearAndRemember
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  qud([question(system,bus,_18842,wantBus(_18842)),question(user,time,_18862,tt(_18842,_18862,gotaplatsen,_18874))])
  moves([assert(wantBus(b55)),(ask(question(system,bus,_18866,wantBus(_18866))),system,user),ask(question(user,time,_18896,tt(_18902,_18896,gotaplatsen,_18908))),(counterGreet,system,user),greet])
  pending(assert(wantBus(b55)),user,system)
  hasTurn(system)

Applied: processAssert
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([assert(wantBus(b55)),(ask(question(system,bus,_18964,wantBus(_18964))),system,user),ask(question(user,time,_18994,tt(_19000,_18994,gotaplatsen,_19006))),(counterGreet,system,user),greet])
  hasTurn(system)
  userFact(wantBus(b55))
  qud([question(user,time,_18940,tt(b55,_18940,gotaplatsen,_18952))])

Applied: produceAnswer
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([assert(wantBus(b55)),(ask(question(system,bus,_19116,wantBus(_19116))),system,user),ask(question(user,time,_19146,tt(_19152,_19146,gotaplatsen,_19158))),(counterGreet,system,user),greet])
  hasTurn(system)
  userFact(wantBus(b55))
  agenda(shortAnswer(time,t20),system,user)
  qud([])
  answered(question(user,time,t20,tt(b55,t20,gotaplatsen,sciencePark)))

Applied: utterAndRemember
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  userFact(wantBus(b55))
  qud([])
  answered(question(user,time,t20,tt(b55,t20,gotaplatsen,sciencePark)))
  utter(shortAnswer(time,t20),system,user)
  moves([(shortAnswer(time,t20),system,user),assert(wantBus(b55)),(ask(question(system,bus,_18894,wantBus(_18894))),system,user),ask(question(user,time,_18924,tt(_18930,_18924,gotaplatsen,_18936))),(counterGreet,system,user),greet])
  hasTurn(user)

OK
```

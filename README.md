# Linear Prolog for Dialogue Management

This repository contains a framework for dialogue management based on linear logic and implemented in Prolog. The ideas underpinning the framework are outlined in the paper [Vladislav Maraev, Jean-Philippe Bernardy, Jonathan Ginzburg "Dialogue management with linear logic: the role of metavariables in questions and clarifications" (2020), Traitement Automatique des Langues, Volume 61, Numéro 3 : Dialogue et systèmes de dialogue](https://aclanthology.org/2020.tal-3.3/).

The code is inspired by, and adapts examples from, the Haskell-based implementation [ProLin](https://github.com/GU-CLASP/ProLin).

Requirements: SWI Prolog

## Example
`swipl -g run form_filling.pl`

should produce output akin to:

```
-------------------
State:
  heard(greet,user,system)
  hasTurn(user)
  moves([])
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)

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

Applied: q1
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([(counterGreet,system,user),greet])
  hasTurn(user)
  heard(ask(question(user,time,_1256,tt(_1262,_1256,gotaplatsen,_1268))),user,system)

Applied: hearAndRemember
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_1356,tt(_1362,_1356,gotaplatsen,_1368))),(counterGreet,system,user),greet])
  pending(ask(question(user,time,_1354,tt(_1360,_1354,gotaplatsen,_1366))),user,system)
  hasTurn(system)

Applied: pushQUD
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_1280,tt(_1286,_1280,gotaplatsen,_1292))),(counterGreet,system,user),greet])
  hasTurn(system)
  qud([question(user,time,_1276,tt(_1282,_1276,gotaplatsen,_1288))])

Applied: produceCR
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_1264,tt(_1270,_1264,gotaplatsen,_1276))),(counterGreet,system,user),greet])
  hasTurn(system)
  qud([question(user,time,_1260,tt(_1266,_1260,gotaplatsen,_1272))])
  cr

Applied: produceCR
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_1412,tt(_1418,_1412,gotaplatsen,_1424))),(counterGreet,system,user),greet])
  hasTurn(system)
  qud([question(user,time,_1408,tt(_1414,_1408,gotaplatsen,_1420))])
  cr
  cr

Applied: specificCR
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([ask(question(user,time,_1424,tt(_1430,_1424,gotaplatsen,_1436))),(counterGreet,system,user),greet])
  hasTurn(system)
  cr
  qud([question(system,bus,_1420,wantBus(_1420)),question(user,time,_1440,tt(_1420,_1440,gotaplatsen,_1452))])
  agenda(ask(question(system,bus,_1422,wantBus(_1422))),system,user)

Applied: utterAndRemember
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  cr
  qud([question(system,bus,_1388,wantBus(_1388)),question(user,time,_1408,tt(_1388,_1408,gotaplatsen,_1420))])
  utter(ask(question(system,bus,_1390,wantBus(_1390))),system,user)
  moves([(ask(question(system,bus,_1398,wantBus(_1398))),system,user),ask(question(user,time,_1428,tt(_1434,_1428,gotaplatsen,_1440))),(counterGreet,system,user),greet])
  hasTurn(user)

Applied: q2b
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  cr
  qud([question(system,bus,_1256,wantBus(_1256)),question(user,time,_1276,tt(_1256,_1276,gotaplatsen,_1288))])
  moves([(ask(question(system,bus,_1266,wantBus(_1266))),system,user),ask(question(user,time,_1296,tt(_1302,_1296,gotaplatsen,_1308))),(counterGreet,system,user),greet])
  hasTurn(user)
  heard(assert(wantBus(b55)),user,system)

Applied: hearAndRemember
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  cr
  qud([question(system,bus,_1402,wantBus(_1402)),question(user,time,_1422,tt(_1402,_1422,gotaplatsen,_1434))])
  moves([assert(wantBus(b55)),(ask(question(system,bus,_1426,wantBus(_1426))),system,user),ask(question(user,time,_1456,tt(_1462,_1456,gotaplatsen,_1468))),(counterGreet,system,user),greet])
  pending(assert(wantBus(b55)),user,system)
  hasTurn(system)

Applied: processAssert
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  cr
  moves([assert(wantBus(b55)),(ask(question(system,bus,_1340,wantBus(_1340))),system,user),ask(question(user,time,_1370,tt(_1376,_1370,gotaplatsen,_1382))),(counterGreet,system,user),greet])
  hasTurn(system)
  userFact(wantBus(b55))
  qud([question(user,time,_1316,tt(b55,_1316,gotaplatsen,_1328))])

Applied: produceAnswer
-------------------
State:
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  cr
  moves([assert(wantBus(b55)),(ask(question(system,bus,_1490,wantBus(_1490))),system,user),ask(question(user,time,_1520,tt(_1526,_1520,gotaplatsen,_1532))),(counterGreet,system,user),greet])
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
  moves([(shortAnswer(time,t20),system,user),assert(wantBus(b55)),(ask(question(system,bus,_1474,wantBus(_1474))),system,user),ask(question(user,time,_1504,tt(_1510,_1504,gotaplatsen,_1516))),(counterGreet,system,user),greet])
  hasTurn(user)
```

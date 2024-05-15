# Linear Prolog for Dialogue Management

This repository contains a framework for dialogue management based on linear logic and implemented in Prolog. The ideas underpinning the framework are outlined in the paper [Vladislav Maraev, Jean-Philippe Bernardy, Jonathan Ginzburg "Dialogue management with linear logic: the role of metavariables in questions and clarifications" (2020), Traitement Automatique des Langues, Volume 61, Numéro 3 : Dialogue et systèmes de dialogue](https://aclanthology.org/2020.tal-3.3/).

The code is inspired by, and adapts examples from, the Haskell-based implementation [ProLin](https://github.com/GU-CLASP/ProLin).

Requirements: SWI Prolog

## Example
`swipl -t 'test_coverage(form_filling, test/dialog_coverage_form_filling)' test/test_coverage.pl`

should produce output akin to:

```
Running test no_clarification_needed

Applied: hearAndRemember
-------------------
State:
  qud([])
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([greet])
  pending(greet)
  hasTurn(system)

(...)

Running test clarification

Applied: hearAndRemember
-------------------
State:
  qud([])
  tt(b18,t15,gotaplatsen,johanneberg)
  tt(b55,t20,gotaplatsen,sciencePark)
  moves([greet])
  pending(greet)
  hasTurn(system)

(...)

OK
```

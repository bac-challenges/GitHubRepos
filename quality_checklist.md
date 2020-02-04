# Quality Checklist

## Readability

* [ ] Good naming that reflects the semantic meaning
* [ ] No dead code that confuses people
* [ ] Consistent coding style
* [ ] A well-structured project including file names and folder structure
* [ ] Cyclomatic complexity is low - no extensive nested logic
* [ ] Good use of commenting - relies mostly on understandable code but documents tricky parts
* [ ] If there are shortcomings, they are highlighted in the final notes file

## Maintainability

* [ ] Refrains from copy & paste code
* [ ] The trivial functionality is not imported as a 3rd party dependency
* [ ] The abstractions (classes, functions) are easy to understand. They are not trying to do too many things
* [ ] Refrains from using global mutable state
* [ ] Logic is easy to follow and thought through rather than built by incremental (build/run/see) changes until all works
* [ ] Single source of truth - When you need to change something, you can change it in one place most of the time, and it is sufficient
* [ ] Good selection of 3rd party dependencies - choices of 3rd party dependencies are well maintained, well tested and free of bloat
* [ ] There is a well-layered architecture and responsibilities do not leak across layers
* [ ] The project layout reflects this layering/separation of concerns and it is intuitive to navigate
* [ ] There are no memory leaks, no circular references (if applicable for your programming language/platform)
* [ ] There are no warnings
* [ ] Simple Things are kept simple, complex ones make sense and are easy to follow
* [ ] Advanced techniques are used only in places where it makes sense
* [ ] Immutable data structures are preferred
* [ ] Evidence of good understanding of side effects and they are pushed to the boundaries, leaving the majority of the code easy to test with unit tests

## Efficiency

* [ ] The code uses the appropriate set of data structures and algorithms. The Big-O complexity is taken into account
* [ ] For a given language/platform/framework, idiomatic programming practices are applied
* [ ] The platform/framework provided APIs are used appropriately. The code does not reimplement things that are already provided by the platform
* [ ] The platform/framework behavior is understood (E.g. application lifecycle events)
* [ ] No premature optimization (E.g. not introducing complexity to optimize things that are not profiled)
* [ ] Optimized network round trips
* [ ] Memory usage optimization for long-running programs

## Testability

* [ ] The code is refactored so that you can write isolated unit tests - classes & methods are not trying to do too many things
* [ ] Pragmatic - if the test is not adding value on top of what compiler already does, then it is not necessary
* [ ] The tests assert one thing (to the extent possible) at a time
* [ ] Dependencies are injected, rather than instantiated within functions and classes
* [ ] Test code quality is also high - maintainability is taken into account
* [ ] Dependencies are minimized, so there is little mocking required
* [ ] Test pyramid approach is well understood - more unit tests, fewer integration tests, even fewer UI/end-to-end tests
* [ ] Good test framework choice
* [ ] Advanced refactoring - side effects well isolated leaving most of the code unit testable with almost no mocking required
* [ ] Well refactored test code - as good as the codebase itself

## Functionality

* [ ] The code works as specified in the challenge
* [ ] There are no extra requirements invented other than the ones provided
* [ ] Users are presented with useful error messages and progress indicators
* [ ] There is a good error handling architecture throughout
* [ ] Errors do not leave the system in an unstable/unknown state

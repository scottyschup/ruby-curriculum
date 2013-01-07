# Intro TDD

Selections from the [Wikipedia article on TDD][wiki-tdd]:

> Test-driven development (TDD) is a software development process that
relies on the repetition of a very short development cycle: first the
developer writes an (initially failing) automated test case that
defines a desired improvement or new function, then produces the
minimum amount of code to pass that test and finally refactors the new
code to acceptable standards.
>
> There are various aspects to using test-driven development, for
example the principles of "keep it simple, stupid" (KISS) and "You
ain't gonna need it" (YAGNI). By focusing on writing only the code
necessary to pass tests, designs can be cleaner and clearer than is
often achieved by other methods.

> **Write the tests first.** The tests should be written before the
functionality that is being tested. This has been claimed to have many
benefits. It helps ensure that the application is written for
testability, as the developers must consider how to test the
application from the outset, rather than worrying about it later. It
also ensures that tests for every feature will be written.
Additionally, writing the tests firsts drives a deeper and earlier
understanding of the product requirements, ensures the effectiveness
of the test code, and maintains a continual focus on the quality of
the product.

> **First fail the test cases.** The idea is to ensure that the test
really works and can catch an error. Once this is shown, the
underlying functionality can be implemented.

> **Keep the unit small.** For TDD, a unit is most commonly defined as
a class or group of related functions, often called a module. Keeping
units relatively small is claimed to provide critical benefits,
including: 1) Reduced Debugging Effort – When test failures are
detected, having smaller units aids in tracking down errors. 2)
Self-Documenting Tests – Small test cases have improved readability
and facilitate rapid understandability.

> Test-driven development offers more than just simple validation of
correctness, but can also drive the design of a program. By focusing
on the test cases first, one must imagine how the functionality will
be used by clients (in the first case, the test cases). So, the
programmer is concerned with the interface before the implementation.

> TDD can lead to more modularized, flexible, and extensible code.
This effect often comes about because the methodology requires that
the developers think of the software in terms of small units that can
be written and tested independently and integrated together later.
This leads to smaller, more focused classes, looser coupling, and
cleaner interfaces. The use of the mock object design pattern also
contributes to the overall modularization of the code because this
pattern requires that the code be written so that modules can be
switched easily between mock versions for unit testing and "real"
versions for deployment. [Ed: Testing in general (even outside the TDD
context) contributes significantly to code extensibility; a test suite
gives you a safety net that ensures that none of your new changes
break any of your old code.]

> Because no more code is written than necessary to pass a failing
test case, automated tests tend to cover every code path. For example,
in order for a TDD developer to add an else branch to an existing if
statement, the developer would first have to write a failing test case
that motivates the branch. As a result, the automated tests resulting
from TDD tend to be very thorough: they will detect any unexpected
changes in the code's behaviour. This detects problems that can arise
where a change later in the development cycle unexpectedly alters
other functionality.

## Further Resources:
* [HN thread on TDD in the context of startups][hn-tdd-startups]

[wiki-tdd]: http://en.wikipedia.org/wiki/Test-driven_development
[hn-tdd-startups]: http://news.ycombinator.com/item?id=2240595

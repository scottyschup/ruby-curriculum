# Intro Ruby Topics
## Meta

+ [Course Preliminaries][course-preliminaries]
+ [Daily requirements][daily-requiements]
+ [First day instructions][first-day-instructions]

[course-preliminaries]: https://github.com/appacademy/meta/blob/master/course-preliminaries.md
[daily-requiements]: https://github.com/appacademy/meta/blob/master/daily-requirements.md
[first-day-instructions]: https://github.com/appacademy/meta/blob/master/first-day-instructions.md

## Ruby basics
### w1d1
+ Primitive Ruby types (common methods)
  + [Array][array]
  + [String][string]
  + [Hash][hash]
  + [Enumerable][enumerable]
  + [Object][object]
+ Debugging
  + [pry and debugger][pry-and-debugger]
  + [common error messages][common-error-messages]
+ [Source files][source-files]
+ **Project**: In Words (ex #15) from [Test First Ruby][test-first-ruby]
+ **Bonus project**: [Maze solver][maze-project]
+ **Bonus project**: Use Ruby to solve the
  [eight-queens problems][eight-queens]

[array]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/array.md
[string]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/string.md
[hash]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/hash.md
[enumerable]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/enumerable.md
[object]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/object.md
[pry-and-debugger]: https://github.com/appacademy/ruby-curriculum/blob/master/debugging/debugger.md
[common-error-messages]: https://github.com/appacademy/ruby-curriculum/blob/master/debugging/common-exceptions.md
[source-files]: ./language-basics/source-files.md

[test-first-ruby]: https://github.com/alexch/learn_ruby
[maze-project]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/maze-solver.md
[eight-queens]: http://en.wikipedia.org/wiki/Eight_queens_puzzle

### w1d2
+ [Iteration][iteration]
+ [Methods][methods]
+ [Symbols, Strings, and Option Hashes][symbols-and-strings]
+ [Input/Output][input-output]
+ [Coding style][coding-style]
+ [Classes][classes]
+ [Pass by reference][pass-by-reference]
+ **Project**: [MicroBlogger][microblogger] 
  * Don't do the Klout part.

[iteration]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/iteration.md
[methods]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/methods.md
[symbols-and-strings]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/symbols-and-strings.md
[input-output]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/io.md
[coding-style]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/coding-style.md
[classes]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/classes.md
[pass-by-reference]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/pass-by-reference.md

[microblogger]: http://tutorials.jumpstartlab.com/projects/microblogger.html

### w1d3
+ [Blocks][blocks]
+ [Recursion][recursion]
+ [Scope][scope]
+ **Project**: [Test First Ruby][test-first-ruby] XML parser   [method_missing][method_missing]
+ **Bonus project**: [Word chains][word-chains]
  + Hint: first write a method `adjacent_words` which gives an array
    of all words "one letter away".

[blocks]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/blocks.md
[recursion]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/recursion.md
[scope]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/scope.md
[word-chains]:  http://www.rubyquiz.com/quiz44.html

[test-first-ruby]: https://github.com/alexch/learn_ruby
[method_missing]: https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/reflection.md#method_missing

## Basic design
### w1d4
+ [DRY: Don't Repeat Yourself][dry]
+ [Choosing good names][naming]
+ [Method decomposition][method-decomposition]
+ [Refactoring and Code Smells][code-smells]
+ **Project**: Review old code.
+ **Project**: [Mastermind][mastermind]
+ **Project**: [Hangman][hangman]
+ **Bonus Project**: [Write a simple version of Sokoban!!!](http://rubyquiz.com/quiz5.html)

[dry]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/dry.md
[naming]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/naming.md
[method-decomposition]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/method-decomposition.md
[code-smells]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/refactoring.md

[mastermind]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/mastermind.md
[hangman]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/hangman.md

## Algorithms
### w1d5
+ [Intro data structures][intro-data-structures]

[intro-data-structures]: https://github.com/appacademy/ruby-curriculum/blob/master/intro-algorithms.md

## Git
### w1d6-w1d7
+ [git](https://github.com/appacademy/ruby-curriculum/blob/master/git.md)

## Language Basics II, OO Design
### w2d1
+ [Serialization](https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/serialization.md) (JSON and YAML)
+ [Gems and rvm](https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/gems-and-rvm.md)
+ **Project**: [Git immersion](http://gitimmersion.com/)
  + **Project**: Do Hangman and Word chains again, using git this
  time. Do not refer to your old code.
+ **Project**: [Minesweeper][minesweeper]

[minesweeper]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/minesweeper.md

### w2d2
+ [Class inheritance](https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/inheritance.md)
+ [Exceptions, error handling](https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/exceptions.md)
+ [Decomposition into objects](https://github.com/appacademy/ruby-curriculum/blob/master/oo-design/decomposition.md)
+ [Inheritance, Polymorphism and DRY](https://github.com/appacademy/ruby-curriculum/blob/master/oo-design/inheritance.md)
+ [Information hiding/encapsulation](https://github.com/appacademy/ruby-curriculum/blob/master/oo-design/hiding.md)
+ **Project**: [Chess](https://github.com/appacademy/ruby-curriculum/blob/master/projects/chess.md)

## The Web
### w2d3
+ [HTTP](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/http.md)
+ [APIs](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/apis.md)
+ [Cookies](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/cookies.md)
+ [Intro to authentication](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/intro-auth.md)
+ [OAuth](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/oauth.md)
+ **Project**: [Ice Cream Finder](https://github.com/appacademy/ruby-curriculum/blob/master/projects/ice-cream-finder.md)
* **Project**: [Twitter Client](https://github.com/appacademy/ruby-curriculum/blob/master/projects/twitter-client.md)

## RSpec
### w2d4-w2d5
+ [TDD](https://github.com/appacademy/ruby-curriculum/blob/master/rspec/intro-tdd.md)
+ [Whirlwind introduction to rspec](https://github.com/appacademy/ruby-curriculum/blob/master/rspec/intro-rspec.md)
+ [Test doubles](https://github.com/appacademy/ruby-curriculum/blob/master/rspec/test-doubles.md)
+ **Project**: [First TDD Projects][first-tdd-projects]

[first-tdd-projects]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/first-tdd-projects.md

### w2d6-w2d7
+ [Read additional git chapters](https://github.com/appacademy/ruby-curriculum/blob/master/git.md)

## Additional Bonus Topics
+ [Modules](https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/modules.md)
+ [Reflection and Metaprogramming](https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/reflection.md)
+ [Regular Expressions](https://github.com/appacademy/ruby-curriculum/blob/master/regex.md)

### Possible new chapters
* require
* What is a DSL?
* command line tutorial
* **TODO: Readings from Well Grounded Rubyist?**

# Intro Ruby Topics
## Meta

+ [Course Preliminaries][course-preliminaries]
+ [Daily requirements][daily-requirements]
+ [First day instructions][first-day-instructions]

[course-preliminaries]: https://github.com/appacademy/meta/blob/master/course-preliminaries.md
[daily-requirements]: https://github.com/appacademy/meta/blob/master/daily-requirements.md
[first-day-instructions]: https://github.com/appacademy/meta/blob/master/first-day-instructions.md

## Ruby basics
### w1d1
+ [Keyboard Shortcuts][keyboard-shortcuts]
+ [A note on Ruby versions][versions]
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
+ [Writing a Ruby Script][writing-a-script]
+ **Project**: In Words (ex #15) from [Test First Ruby][test-first-ruby]
+ **Bonus project**: [Maze solver][maze-project]
+ **Bonus project**: Use Ruby to solve the
  [eight-queens problems][eight-queens]

[versions]: ./language-basics/versions.md
[array]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/array.md
[string]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/string.md
[hash]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/hash.md
[enumerable]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/enumerable.md
[object]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/data-structures/object.md
[pry-and-debugger]: https://github.com/appacademy/ruby-curriculum/blob/master/debugging/debugger.md
[common-error-messages]: https://github.com/appacademy/ruby-curriculum/blob/master/debugging/common-exceptions.md
[source-files]: ./language-basics/source-files.md
[writing-a-script]: ./language-basics/writing-a-script.md
[keyboard-shortcuts]: https://github.com/appacademy/ruby-curriculum/blob/master/shortcuts.md

[test-first-ruby]: https://github.com/alexch/learn_ruby
[maze-project]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/maze-solver.md
[eight-queens]: http://en.wikipedia.org/wiki/Eight_queens_puzzle

### w1d2
+ [Methods][methods]
+ [DRY: Don't Repeat Yourself][dry]
+ [Coding style][coding-style]
+ [Method decomposition][method-decomposition]
+ [Choosing good names][naming]
+ [Iteration][iteration]
+ [Symbols, Strings, and Option Hashes][symbols-and-strings]
+ [Input/Output][input-output]
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
[dry]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/dry.md
[naming]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/naming.md
[method-decomposition]: https://github.com/appacademy/ruby-curriculum/blob/master/basic-design/method-decomposition.md

[microblogger]: http://tutorials.jumpstartlab.com/projects/microblogger.html

### w1d3
+ [Blocks][blocks]
+ [Recursion][recursion]
+ [Scope][scope]
+ **project**: [Word chains][word-chains]
+ **Project**: [Test First Ruby][test-first-ruby] XML parser (use [method_missing][method_missing])

[blocks]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/blocks.md
[recursion]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/recursion.md
[scope]: https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/scope.md
[word-chains]:  ./projects/word-chains.md

[test-first-ruby]: https://github.com/alexch/learn_ruby
[method_missing]: https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/reflection.md#method_missing

## Basic design
### w1d4
+ [Refactoring and Code Smells][code-smells]
+ **Project**: Review old code.
+ **Project**: [Mastermind][mastermind]
+ **Project**: [Hangman][hangman]

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
+ **Project**: [Git immersion](http://gitimmersion.com/)
  + **Project**: Do Hangman and Word chains again, using git this
  time. Do not refer to your old code.

## Language Basics II, OO Design
### w2d1
+ [Serialization](https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/serialization.md) (JSON and YAML)
+ [Gems and rvm](https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/gems-and-rvm.md)
+ **Project**: [Minesweeper][minesweeper]
    * Use git. Here's a [git summary][git-summary].
    * Reread the [code review chapter][code-review]
    * [Code review NYC][code-review-nyc]

[git-summary]: ./git-summary.md
[minesweeper]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/minesweeper.md
[code-review]: https://github.com/appacademy/meta/blob/master/code-reviews.md
[code-review-nyc]: https://github.com/appacademy/meta/blob/master/code-reviews-nyc.md

### w2d2
+ [Class inheritance](https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/inheritance.md)
+ [Exceptions, error handling](https://github.com/appacademy/ruby-curriculum/blob/master/language-basics/exceptions.md)
+ [Decomposition into objects](https://github.com/appacademy/ruby-curriculum/blob/master/oo-design/decomposition.md)
+ [Inheritance, Polymorphism and DRY](https://github.com/appacademy/ruby-curriculum/blob/master/oo-design/inheritance.md)
+ [Information hiding/encapsulation](https://github.com/appacademy/ruby-curriculum/blob/master/oo-design/hiding.md)
+ **Project**: [Chess](https://github.com/appacademy/ruby-curriculum/blob/master/projects/chess.md)

### w2d3
* Continue Chess.

## The Web
### w2d4
+ [HTTP](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/http.md)
+ [APIs](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/apis.md)
+ [Cookies](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/cookies.md)
+ [Intro to authentication](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/intro-auth.md)
+ [OAuth](https://github.com/appacademy/ruby-curriculum/blob/master/the-web/oauth.md)
+ **Project**: [Ice Cream Finder][ice-cream-finder]
* **Project**: [Twitter Client][twitter-client]

[ice-cream-finder]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/ice-cream-finder.md
[twitter-client]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/twitter-client.md

## Solo
### w2d5
* **Project**: [Checkers][checkers-project]

[checkers-project]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/checkers.md

### w2d6-w2d7
+ [Read additional git chapters](https://github.com/appacademy/ruby-curriculum/blob/master/git.md)

## RSpec
### w3d1
+ [TDD](https://github.com/appacademy/ruby-curriculum/blob/master/rspec/intro-tdd.md)
+ [Whirlwind introduction to rspec](https://github.com/appacademy/ruby-curriculum/blob/master/rspec/intro-rspec.md)
+ [Test doubles](https://github.com/appacademy/ruby-curriculum/blob/master/rspec/test-doubles.md)
+ [`subject` and `let`][subject-and-let]
+ **Prep**: read assessment00 and assessment01 spec files the the
  night before.
    * Learn what you don't know about those specs.
+ **Project**: [First TDD Projects][first-tdd-projects]
+ **Project**: [Reversi][reversi-project]

[subject-and-let]: https://github.com/appacademy/ruby-curriculum/blob/master/rspec/subject-and-let.md
[first-tdd-projects]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/first-tdd-projects.md
[reversi-project]:https://github.com/appacademy/ruby-curriculum/blob/master/projects/reversi.md

### w3d2
+ **Project**: [Poker][poker-project]

[poker-project]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/poker.md

## Additional Bonus Topics
+ [Modules](https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/modules.md)
+ [Reflection and Metaprogramming](https://github.com/appacademy/ruby-curriculum/blob/master/language-intermediate/reflection.md)
+ [Regular Expressions](https://github.com/appacademy/ruby-curriculum/blob/master/regex.md)

### Possible new chapters
* require
* What is a DSL?
* command line tutorial
* **TODO: Readings from Well Grounded Rubyist?**

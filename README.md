# Intro Ruby Topics

## Ruby basics
### w1d1
+ [Course Preliminaries](https://github.com/ruggeri/ruby-curriculum/blob/master/meta/course-preliminaries.md)
+ Primitive Ruby types (common methods)
  + [Array][array] ([wiki][wiki-array])
  + [String][string] ([wiki][wiki-string])
  + [Hash][hash] ([wiki][wiki-hash])
  + [Enumerable][enumerable] ([wiki][wiki-enumerable])
  + [Object][object] ([wiki][wiki-object])
+ Debugging
  + [pry and debugger][pry-and-debugger] ([wiki][wiki-pry-and-debugger])
  + [common error messages][common-error-messages] ([wiki][wiki-common-error-messages])
+ **Project**: In Words (ex #15) from [Test First Ruby][test-first-ruby]
+ **Bonus project**: [Maze solver][maze-project]

[array]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/data-structures/array.md
[wiki-array]: https://github.com/ruggeri/ruby-curriculum/wiki/Array:-questions
[string]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/data-structures/string.md
[wiki-string]: https://github.com/ruggeri/ruby-curriculum/wiki/String:-questions
[hash]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/data-structures/hash.md
[wiki-hash]: https://github.com/ruggeri/ruby-curriculum/wiki/Hash:-questions
[enumerable]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/data-structures/enumerable.md
[wiki-enumerable]: https://github.com/ruggeri/ruby-curriculum/wiki/Enumerable:-questions
[object]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/data-structures/object.md
[wiki-object]: https://github.com/ruggeri/ruby-curriculum/wiki/Object:-questions
[pry-and-debugger]: https://github.com/ruggeri/ruby-curriculum/blob/master/debugging/debugger.md
[wiki-pry-and-debugger]: https://github.com/ruggeri/ruby-curriculum/wiki/Pry-and-debugger:-questions
[common-error-messages]: https://github.com/ruggeri/ruby-curriculum/blob/master/debugging/common-exceptions.md
[wiki-common-error-messages]: https://github.com/ruggeri/ruby-curriculum/wiki/Error-messages:-questions

[test-first-ruby]: https://github.com/alexch/learn_ruby
[maze-project]: https://github.com/ruggeri/ruby-curriculum/blob/master/projects/maze-solver.md

### w1d2
+ [Iteration][iteration] ([wiki][wiki-iteration])
+ [Methods][methods] ([wiki][wiki-methods])
+ [Symbols and Strings][symbols-and-strings] ([wiki][wiki-symbols-and-strings])
+ [Input/Output][input-output] ([wiki][wiki-input-output])
+ [Coding style][coding-style] ([wiki][wiki-coding-style])
+ [Classes][classes] ([wiki][wiki-classes])
+ [Pass by reference][pass-by-reference] ([wiki][wiki-pass-by-reference])
+ **Project**: [MicroBlogger][microblogger]
+ **Bonus project**: [Word chains][word-chains]
  + Hint: first write a method `adjacent_words` which gives an array
    of all words "one letter away".

[iteration]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/iteration.md
[wiki-iteration]: https://github.com/ruggeri/ruby-curriculum/wiki/Iteration:-questions
[methods]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/methods.md
[wiki-methods]: https://github.com/ruggeri/ruby-curriculum/wiki/Methods:-questions
[symbols-and-strings]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/symbols-and-strings.md
[wiki-symbols-and-strings]: https://github.com/ruggeri/ruby-curriculum/wiki/Symbols-and-strings:-questions
[input-output]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/io.md
[wiki-input-output]: https://github.com/ruggeri/ruby-curriculum/wiki/Input-output:-questions
[coding-style]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/coding-style.md
[wiki-coding-style]: https://github.com/ruggeri/ruby-curriculum/wiki/Coding-style:-questions
[classes]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/classes.md
[wiki-classes]: https://github.com/ruggeri/ruby-curriculum/wiki/Classes:-questions
[pass-by-reference]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/pass-by-reference.md
[wiki-pass-by-reference]: https://github.com/ruggeri/ruby-curriculum/wiki/Pass-by-reference:-questions

[microblogger]: http://tutorials.jumpstartlab.com/projects/microblogger.html
[word-chains]:  http://www.rubyquiz.com/quiz44.html

### w1d3
+ [Blocks][blocks] ([wiki][wiki-blocks])
+ [Recursion][recursion] ([wiki][wiki-recursion])
+ [Scope][scope] ([wiki][wiki-scope])

[blocks]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/blocks.md
[wiki-blocks]: https://github.com/ruggeri/ruby-curriculum/wiki/Blocks:-questions
[recursion]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/recursion.md
[wiki-recursion]: https://github.com/ruggeri/ruby-curriculum/wiki/Recursion:-questions
[scope]: https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/scope.md
[wiki-scope]: https://github.com/ruggeri/ruby-curriculum/wiki/Scope:-questions

## Algorithms
### w1d4
+ [Intro data structures][intro-data-structures] ([wiki][wiki-intro-data-structures])

[intro-data-structures]: https://github.com/ruggeri/ruby-curriculum/blob/master/intro-algorithms.md
[wiki-intro-data-structures]: https://github.com/ruggeri/ruby-curriculum/wiki/Intro-data-structures:-questions

## Basic design
### w1d5
+ [DRY: Don't Repeat Yourself][dry] ([wiki][wiki-dry])
+ [Choosing good names][naming] ([wiki][wiki-naming])
+ [Method decomposition][method-decomposition] ([wiki][wiki-method-decomposition])
+ [Refactoring and Code Smells][code-smells] ([wiki][wiki-code-smells])
+ **Project**: Review old code.
+ **Project**: [Mastermind][mastermind]
+ **Project**: [Hangman][hangman]

[dry]: https://github.com/ruggeri/ruby-curriculum/blob/master/basic-design/dry.md
[wiki-dry]: https://github.com/ruggeri/ruby-curriculum/wiki/DRY:-questions
[naming]: https://github.com/ruggeri/ruby-curriculum/blob/master/basic-design/naming.md
[wiki-naming]: https://github.com/ruggeri/ruby-curriculum/wiki/Choosing-good-names:-questions
[method-decomposition]: https://github.com/ruggeri/ruby-curriculum/blob/master/basic-design/method-decomposition.md
[wiki-method-decomposition]: https://github.com/ruggeri/ruby-curriculum/wiki/Method-decomposition:-questions
[code-smells]: https://github.com/ruggeri/ruby-curriculum/blob/master/basic-design/refactoring.md
[wiki-code-smells]: https://github.com/ruggeri/ruby-curriculum/wiki/Refactoring-and-code-smells:-questions

[mastermind]: https://github.com/ruggeri/ruby-curriculum/blob/master/projects/mastermind.md
[hangman]: https://github.com/ruggeri/ruby-curriculum/blob/master/projects/hangman.md

## Git
### w1d6-w1d7
+ [git](https://github.com/ruggeri/ruby-curriculum/blob/master/git.md)

## Language Basics II, OO Design
### w2d1
+ [Serialization](https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/serialization.md) (JSON and YAML)
+ [Gems and rvm](https://github.com/ruggeri/ruby-curriculum/blob/master/language-intermediate/gems-and-rvm.md)
+ **Project**: [Git immersion](https://github.com/ruggeri/ruby-curriculum/blob/master/http://gitimmersion.com/)
+ **Project**: [Todo list app](https://github.com/ruggeri/ruby-curriculum/blob/master/projects/todo-list.md)

### w2d2
+ [Class inheritance](https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/inheritance.md)
+ [Exceptions, error handling](https://github.com/ruggeri/ruby-curriculum/blob/master/language-basics/exceptions.md)
+ [Decomposition into objects](https://github.com/ruggeri/ruby-curriculum/blob/master/oo-design/decomposition.md)
+ [Inheritance, Polymorphism and DRY](https://github.com/ruggeri/ruby-curriculum/blob/master/oo-design/inheritance.md)
+ [Information hiding/encapsulation](https://github.com/ruggeri/ruby-curriculum/blob/master/oo-design/hiding.md)
+ **Project**: [Chess](https://github.com/ruggeri/ruby-curriculum/blob/master/projects/chess.md)

## The Web
### w2d3
+ [HTTP](https://github.com/ruggeri/ruby-curriculum/blob/master/the-web/http.md)
+ [APIs](https://github.com/ruggeri/ruby-curriculum/blob/master/the-web/apis.md)
+ [Cookies](https://github.com/ruggeri/ruby-curriculum/blob/master/the-web/cookies.md)
+ [Intro to authentication](https://github.com/ruggeri/ruby-curriculum/blob/master/the-web/intro-auth.md)
+ [OAuth](https://github.com/ruggeri/ruby-curriculum/blob/master/the-web/oauth.md)
+ **Project**: [Ice Cream Finder](https://github.com/ruggeri/ruby-curriculum/blob/master/projects/ice-cream-finder.md)
* **Project**: [Twitter Client](https://github.com/ruggeri/ruby-curriculum/blob/master/projects/twitter-client.md)

## RSpec
### w2d4-w2d5
+ [TDD](https://github.com/ruggeri/ruby-curriculum/blob/master/rspec/intro-tdd.md)
+ [Whirlwind introduction to rspec](https://github.com/ruggeri/ruby-curriculum/blob/master/rspec/intro-rspec.md)
+ [Test doubles](https://github.com/ruggeri/ruby-curriculum/blob/master/rspec/test-doubles.md)
+ **Project**: TDD TreeNode
+ **Project**: [SalesEngine][sales-engine]

[sales-engine]: http://tutorials.jumpstartlab.com/projects/sales_engine.html

### w2d6-w2d7
+ [Read additional git chapters](https://github.com/ruggeri/ruby-curriculum/blob/master/git.md)

## Additional Bonus Topics
+ [Modules](https://github.com/ruggeri/ruby-curriculum/blob/master/language-intermediate/modules.md)
+ [Reflection and Metaprogramming](https://github.com/ruggeri/ruby-curriculum/blob/master/language-intermediate/reflection.md)
+ [Regular Expressions](https://github.com/ruggeri/ruby-curriculum/blob/master/regex.md)

### Possible new chapters
* require
* What is a DSL?
* command line tutorial
* **TODO: Readings from Well Grounded Rubyist?**

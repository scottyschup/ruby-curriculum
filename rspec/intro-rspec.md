# Intro RSpec
## CodeSchool RSpec
First watch the [CodeSchool rspec video][codeschool-rspec] and
complete the exercises (click the red arrows on the left). They
mention a lot of contrasts between RSpec and Test::Unit, but just
ignore those, as we won't use Test::Unit (and neither do many other
people).

You may also wish to read David Chelimsky's blog post
[Introduction to RSpec][chelimsky-rspec-intro]. This covers a lot of
the same info as CodeSchool, but it's worth seeing twice. The post is
a bit old, so keep in mind the following errata:

* `> spec user_spec.rb` should be `> rspec user_spec.rb`
* `require 'user'` should be `require './user'`
* `$ spec user_spec.rb --format specdoc` should be `$ rspec user_spec.rb --format doc`

## RSpec Book
Next, read through ch12 (Code Examples) and ch13 (RSpec::Expectations)
of the [RSpec Book][rspec-book]. This goes in much more detail about
RSpec; make sure you know the answers to the questions below.

**In ch13 you can skim ch13.5 which is about `have`; this bit of sugar
is not very important to us**

### Ch12
* `describe`
  * What is an example group?
  * How do you indicate what class the examples are for?
* What is the `context` method?
  * We usually `describe` a class or `method`, which is what we're
    testing. `context` is to set up the context "preconditions" of a
    group of tests. Since `describe` and `context` are aliases for
    each other, it won't hurt if you get this wrong.
* `it`
  * How do you name examples?
  * What word shouldn't you use in example titles?
  * What is a pending example?
    * They are examples you haven't gotten to writing yet, or need to fix bugs for
    * e.g. call `it "<should do something.. explanation string>"` without a block.
    * e.g. within `#it` block, at the top line, call `pending "<expanation for pending>"`
  * What parameters does it take?
* What is the difference between `before(:each)` and `before(:all)`?
  * Which one should you use most of the time?
* How do you share example groups?
  * Use `shared_examples_for "general subject"` passing it a block with each general test
  * Call these general tests in an applicable #describe block using `it_behaves_like "general subject"`

### Ch13

* `should`, `should_not`, matchers
  * What objects are these methods available on?
  * What is a matcher?
  * [Read about][expect-syntax] the new `expect` syntax that rspec will be leaning towards
[expect-syntax]: http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
* What is the most common equality matcher?
* Which is correct: `should_not ==` or `should !=`?  
  * Never use `something.should != another`, it is interpreted by Ruby as `!(something.should == another)`
* How can you use `be_close` matcher to test if a value is within
  some range?
* How do you match a regular expression? use `#match` or `=~` operator
* How can you use `expect {...}.to change{...}` to express an event
  and an outcome?
* How can you use `raise_error` to match an error?
* How can you use `be_x` to set an expectation that a predicate should
  return a specific result?
* How can you specify that a return value should "be truthy" (not
  `false` or `nil`), rather than be the `true` value itself?
  * Use `==` to check truthy-ness
  * Use `#equals` to check whether value *equals* true or false
* How do you test the value of `has_key?`, and other methods starting
  with `has_`?
* What are generated descriptions?
  * `it` and `specify` are aliases, why do we use one or the other?
* What is the `subject` of an example?
  * How do we set the `subject` and use this to write more concise
    tests?

## Better Specs

[Better Specs][better-specs] has lots of good advice for how to write
good tests. You should ignore Rails specific parts (and we'll show you
how to set up guard later), but 90% of the advice should already be
useful.

[better-specs]: http://betterspecs.org/

## More tips

RSpec is a moving target, and a couple handy features aren't mentioned
in the book.

The RSpec Book shows you how to use `subject`, which is preferred to
setting an instance variable in the `before` block. The book shows you
how to access the `subject` inside an example. You can also give the
subject a name for ease of readability.

```ruby
describe Person do
  subject(:person) { Person.new(:birthdate => 19.years.ago }
  
  it { should be_eligible_to_vote }
  specify { person.should be_eligible_to_vote }
  
  # we can write an expectation of the `#age` method's result with
  # `its`.
  its(:age) { should == 19 }
end
```

A final trick to avoid setting instance variables in the `before`
block is to use `let`:

```ruby
describe Robot do
  subject(:robot) { Robot.new }
  let(:light_item) { double("heavy_item", :weight => 1) }
  let(:max_weight_item) { double("max_weight_item", :weight => 250) }

  describe "#pick_up" do
    it "should not add item past maximum weight of 250" do
      robot.pick_up(max_weight_item)

      expect do
        robot.pick_up(light_item)
      end.to raise_error(ArgumentError)
    end
  end
end
```

Read more about why `let` may be preferred [here][myron-on-let].

## Review Robot Spec

Go back to the robot spec from the intro assessment. Read
the spec file and make sure everything makes sense to you.

## Unit vs Integration Tests
**TODO: this graph doesn't go here**
The unit tests are very specific and are meant to isolate logical
problems within a class; the integration tests are larger in scope and
are intended to check that objects interact properly. A thorough test
suite will have both unit and integration tests.

**TODO: show them how to setup guard**

## Resources
* The [RSpec docs][rspec-docs] have lots of useful tricks. Knowing
  RSpec well will let you write beautiful specs.
* [Here's a good RSPEC resource][monkeyman], with lots of clear examples.

[monkeyman]: http://rubydoc.info/gems/rspec-mocks/
[codeschool-rspec]: http://rspec.codeschool.com/levels/1
[chelimsky-rspec-intro]: http://blog.davidchelimsky.net/2007/05/14/an-introduction-to-rspec-part-i/
[rspec-book]: http://pragprog.com/book/achbd/the-rspec-book
[rspec-docs]: https://www.relishapp.com/rspec/rspec-core/v/2-4/docs
[myron-on-let]: http://stackoverflow.com/a/5359979
[robot-spec]: ../assessments/00_intro_assessment/robot_spec.rb
[rspec-cheat-sheet]: https://gist.github.com/dnagir/663876

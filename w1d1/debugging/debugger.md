# Debugging

Any program of sufficient complexity is unlikely to work the first
time.  You will make mistakes. Skilled and unskilled developers write
a similar number of bugs. The difference is that skilled developers
are able to quickly identify and fix bugs.

A rule of thumb is that it takes 10x as long to debug code as
to write it. Master debugging and you master programming.

## Rule #1: Read the error

Rule #1 is to **READ THE ERROR**.

Do NOT simply jump back to your program and start fiddling with things
to see if you can get it to work. Always read the error. Oftentimes
it tells you everything you need to know.

The error gives you valuable pieces of information. The first
three are absolutely essential to read and understand whenever
an error occurs.

  * Error type
  * Error message
  * Line number on which the error occurred
  * Chain of methods that were called leading up to it
    (referred to as the **stack trace**)

If you encounter an error and you are unclear about what the error
type and/or message is telling you, stop and ask an instructor to
explain it to you. Learning to understand errors and error messages
is critical to developing your abilities as a programmer.

## Perform a Mental Stack Trace

The stack trace below the error message can be extremely helpful,
but it usually won't give you the exact information you need to
fix your bug. What it does tell you is the path your program took
to get to wherever the error happened.

Whenever you encounter a bug your ability to track it down will be
dependent on your ability to trace the logic of your own code.

Interrogate your code actively. Why did the bug happen? What are the
values of the key variables at key points in your program? What did
each line evaluate to leading up to the bug?

Do not passively stare at your code or simply assume that what you
think happened is what actually happened (this is what got you in
trouble in the first place!). Some strategies include:

* Break your code down into more testable chunks and actively run each
  of those chunks to test if they're working.
* Use `p` statements often; use them to check what the values of
  variables are, that methods are called as expected, etc.
* Use the debugger.

The key with bugs and errors is to really get into the mind of the
machine. You must understand what is happening in the code. To do so,
you must seek out helpful feedback from the program, constantly
testing your assumptions about what is happening.

You are a programmer. You hunt bugs. Hunt well.

## Write code that's testable

Let's consider a Ruby script that is supposed to print the first 100
primes:

```ruby
# primes.rb

primes = []

num = 1
while primes.count < 100
  is_prime = true
  (1..num).each do |i|
    if (num % i) == 0
      is_prime = false
      break
    end
  end

  if is_prime
    primes << num
  end
end

puts primes
```

This program doesn't work; it doesn't look like it ever
returns. Where's the bug (or bugs)?

The bugs could be anywhere, but we don't have the ability to isolate
and test individual parts of the code. When we load up this file, it
immediately starts running all the code.

Let's make this more *testable*: let's break the code into small,
bite-sized methods. Small methods are easier to test, because you can
test each part independently.

General hint: when you write a *script*, write all your code inside of
methods. Only a very little bit of code should be written at the top
level to kick things off.

```ruby
# primes.rb

def prime?(num)
  (1..num).each do |i|
    if (num % i) == 0
      return false
    end
  end
end

def primes(num_primes)
  ps = []
  num = 1
  while ps.count < num_primes
    primes << num if prime?(num)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
```

This code uses a common trick. We will want to be able to load our
code without running it immediately. In particular, we'd like to
directly call the methods and diagnose whether each is working. But
before we were blocked because the program immediately started
executing the script and entering an infinite loop.

The solution is the trick `if __FILE__ == $PROGRAM_NAME`. This checks
to see if the currently running program (`$PROGRAM_NAME`) is the same
as the current file (primes.rb). If so, then this is being invoked as
a script, so we should kick things off. Otherwise, we're loading it as
part of some other program (like irb or Pry), and we shouldn't do more
than load the method definitions so that someone else may use them.

Great. Now we can test the `prime?` and `primes` pieces
individually. If one works and the other doesn't, we can focus on the
single broken method. Even if both are broken, we can fix `prime?`
first, and then try to debug `primes` knowing that `prime?` at least
works.

Also, because `prime?` and `primes` do one simple thing, we know what
they're *supposed* to do: `prime?(2)` should be true. `prime?(4)`
should be false. `primes(3)` should be `[2, 3, 5]`.

This is better than a huge, black-box method which does a bunch of
complicated stuff where it's hard to even know what the right answer
should be.

### Pay technical debt

If you encounter buggy code that is poorly decomposed into methods,
**fix the design immediately**. You're going to want to fix the design
eventually anyway; refactoring will probably create new bugs to fix,
so you might as well deal with this bug at the same time.

More importantly, good code is the gift that keeps on giving. If this
code is broken today, it's safe to assume that it will bite you in the
ass with another bug a few days from now, too. And every time you come
back to this code, you'll be fighting its poor design as you try to
deal with it. Try to fix it now once and for all.

In the rush to complete projects, bad design is sometimes a compromise
made to finish a project on-time. This is called *technical
debt*. It's okay to take out debt like this, just like it's okay to
take out financial debt. But the more debt you take out, the higher
the payments in the form of your time.

If you find yourself struggling with a tough bug in the midst of some
poorly written code, admit that your debt has caught up with you, bite
the bullet and refactor.

## Don't read the source

We haven't found out what's wrong yet. You might be tempted to first
look carefully at `prime?` and `primes`, try to reason through them,
and spot the bug. You may be able to do this with my simple example.

**Do not spend more than 1min doing this in real life**. Yes, many
silly bugs can be spotted if you stare at the code, but many other
silly bugs are difficult to spot because our eyes play tricks on
us. You know how you can still read a paragraph with the spaces taken
out? For the same reason, it's hard to spot silly bugs, because you
know what the code is *supposed* to do.

Your bug may not be a simple bug. If it's at all non-trivial, it will
be *very* hard to spot. The best way to find a bug like this is to
take your code step-by-step. We'll see how to do that soon.

Yes, when debugging you should look at the source to familiarize
yourself with the code. The bug may jump out at you. If not, don't
worry. We're about to learn better techniques.

## Pry and debugger

We're going to use three gems.

1. pry (`gem install pry`): this is a replacement
for irb that adds some cool features (like syntax highlighting and the ability to `cd` between Ruby classes and objects and `ls` their methods and variables).

1. byebug (`gem install byebug`): this gem gives us a debugger that works with Ruby version 2.0 and higher. A debugger lets us step through our code one line at a time, and interact with it 'live' (such as checking or even changing the values of variables).

1. pry-byebug (`gem install pry-byebug`): this connects the first two gems

You will navigate through your code with commands like `next`, `step`, and `continue`. To alias these as `n`, `s`, and `c`, create a file in your home directory called `.pryrc` and paste in this content:

```rb
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
```

[pryrc]: https://github.com/appacademy/dotfiles/blob/master/pryrc

## Use the REPL to isolate the problem

Now that we've broken the code up into testable bits, let's actually
test those parts. That lets us quickly isolate the problem to a few
lines.

Type `pry` at your Bash prompt to open the Pry REPL.

```ruby
[1] pry(main)> load './primes.rb'
=> true
[2] pry(main)> prime?(2)
=> false

```

Awesome. We've already found a *regression*; an input which produces
the wrong output. There might also be problems with `primes`, but it would have been a real PITA to try to fix
those when the underlying `prime?` method is broken.

Decomposition for the win.

## Use debugger to step through code

Once you've isolated a bug to a small amount of code, the best way to
uncover the problem is to single-step through the code, checking what
the program does along the way. This is what a *debugger* does.

To start, we need to modify our program slightly so that we *drop
into* the debugger when `prime?` is called:

```ruby
require 'byebug'

def prime?(num)
  debugger # drops us into the debugger at this point

  (1..num).each do |i|
    if (num % i) == 0
      return false
    end
  end
end
```

**N.B.** Don't forget to `require 'byebug'` at the top of your file.

Let's kick the debugger off by calling the method:

```ruby
[david@david-air] ~/Dropbox/app-academy-TA  
❯ pry
[1] pry(main)> load './primes.rb'
=> true
[2] pry(main)> prime?(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 6 Object#prime?:

    3: def prime?(num)
    4:   debugger # drops us into the debugger right after this point
    5:
=>  6:   (1..num).each do |i|
    7:     if (num % i) == 0
    8:       return false
    9:     end
   10:   end
   11: end

  [1] pry(main)>

  ```

`debugger` pauses the execution of the method and drops us into the
*debugger*. The debugger lets us step through our code one line at a
time, testing the result along the way. The debugger prompt looks like
`[1] pry(main)>`. Our position is indicated by the arrow; we're at
line 6.

On line 6 we are calling the `each` method on the range `(1..num)`, so to move into that method we type `step`, or `s` if you set up your aliases above. (There is a bug in Ruby 2.1 that causes us to stay on line 6 the first time we type `step`, so we'll have to `step` twice.)

```ruby
[1] pry(main)> step

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 6 Object#prime?:

    3: def prime?(num)
    4:   debugger # drops us into the debugger right after this point
    5:
=>  6:   (1..num).each do |idx|
    7:     if num % idx == 0
    8:       return false
    9:     end
   10:   end
   11: end

[1] pry(main)> step

  From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 7 Object#prime?:

    3: def prime?(num)
    4:   debugger # drops us into the debugger right after this point
    5:
    6:   (1..num).each do |idx|
=>  7:     if num % idx == 0
    8:       return false
    9:     end
   10:   end
   11: end

[1] pry(main)>
```

You can see how the arrow has advanced. Let's see what happens at this
if statement. Since there is no method call on line 7, we advance with `next` (or `n`).

```ruby
[1] pry(main)> next

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 8 Object#prime?:

    3: def prime?(num)
    4:   debugger # drops us into the debugger right after this point
    5:
    6:   (1..num).each do |idx|
    7:     if num % idx == 0
=>  8:       return false
    9:     end
   10:   end
   11: end

  [1] pry(main)>

```

Wait; we entered the `if`? How? Let's check the values of `num` and
`idx`:

```ruby
[1] pry(main)> num
=> 2
[2] pry(main)> idx
=> 1
```

Hmm... We shouldn't check for divisibility by one. Upon reflection, we
shouldn't start the index at 1 at all; we should start at 2. We can
quit out of the debugger by typing `!!!`, then edit the source.

```ruby
def prime?(num)
  debugger # let's leave this in a moment

  (2..num).each do |idx|
    if num % idx == 0
      return false
    end
  end
end
```

Let's restart the REPL and run again:

```ruby
[2] pry(main)> load './primes.rb'
=> true
[3] pry(main)> prime?(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 6 Object#prime?:

    3: def prime?(num)
    4:   debugger # let's leave this in a moment
    5:
=>  6:   (2..num).each do |idx|
    7:     if num % idx == 0
    8:       return false
    9:     end
   10:   end
   11: end

[1] pry(main)> c
=> false
[4] pry(main)>
```

I used `c` (for `continue`) to tell the debugger to keep running the
code; the code never told us to go back to the debugger, so the
method finished and returned `false`. Looks like we have more work to
do.

Let's use a *breakpoint*:

```ruby
[6] pry(main)> prime?(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 6 Object#prime?:

    3: def prime?(num)
    4:   debugger # let's leave this in a moment
    5:
=>  6:   (2..num).each do |idx|
    7:     if num % idx == 0
    8:       return false
    9:     end
   10:   end
   11: end

[1] pry(main)> break 8
Breakpoint 1: /home/david/Dropbox/app-academy-TA/primes.rb @ 8 (Enabled) :

    5:
    6:   (2..num).each do |idx|
    7:     if num % idx == 0
=>  8:       return false
    9:     end
   10:   end
   11: end

[2] pry(main)> c

Breakpoint 1. First hit

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 8 Object#prime?:

    3: def prime?(num)
    4:   debugger # let's leave this in a moment
    5:
    6:   (2..num).each do |idx|
    7:     if num % idx == 0
=>  8:       return false
    9:     end
   10:   end
   11: end
```

I add a breakpoint to line 8 with the `break` command. This tells the
debugger to make sure to stop when I hit line 8. Since I know 2 is
prime, it should help to put a breakpoint at 8 (where false is
returned), so I can check out what the variables are at this point. I
then tell the program to run freely (`c`, or `continue`), and
eventually we arrive at line 8.

```ruby
[1] pry(main):1> idx
=> 2
[2] pry(main):1> num
=> 2
```

Groan. We are testing whether `num` is divisible by itslf. That's
because `(2..num)` includes num; we wanted `(2...num)`. Fix and then
reload:

```ruby
[1] pry(main)> load './primes.rb'
=> true
[2] pry(main)> prime?(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 6 Object#prime?:

    3: def prime?(num)
    4:   debugger # let's leave this in a moment
    5:
=>  6:   (2...num).each do |idx|
    7:     if num % idx == 0
    8:       return false
    9:     end
   10:   end
   11: end

[1] pry(main)> c
=> 2...2
[3] pry(main)>
```

Weird, but better; at least this isn't false. But because we don't
return `true` at the end of `prime?`, the last returned value is
used. Note that `Enumerable#each` returns `self`; in this case the
range itself. Let's finish fixing this method.

```ruby
def prime?(num)
  (2...num).each do |idx|
    if num % idx == 0
      return false
    end
  end

  true
end
```

Does it really work? We ought to check with a few values other than 2:

```ruby
[7] pry(main)> load './primes.rb'
=> true
[8] pry(main)> prime?(2)
=> true
[9] pry(main)> prime?(3)
=> true
[10] pry(main)> prime?(10)
=> false
[11] pry(main)> prime?(17)
=> true
```

All looks good. Notice how we can quickly check a number of values in
the REPL.

## Reading stack traces

Now that `prime?` appears to be working, it's time to test
`primes`. We've added a call to `debugger` at the start of
`primes`. Again, we use the REPL:

```ruby
[7] pry(main)> load './primes.rb'
=> true
[8] pry(main)> primes(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 16 Object#primes:

    13: def primes(num_primes)
    14:   debugger
    15:
=>  16:   ps = []
    17:   num = 1
    18:   while ps.count < num_primes
    19:     primes << num if prime?(num)
    20:   end
    21: end

[1] pry(main)> c
ArgumentError: wrong number of arguments (0 for 1)
from /home/david/Dropbox/app-academy-TA/primes.rb:13:in 'primes'
```

This means the method failed. When an exception is thrown and no code
catches and handles the exception, then the program stops (crashes)
and the exception and line where it occurred are printed.

The line `ArgumentError: wrong number of arguments (0 for 1)`
states the exception type (`ArgumentError`) and the message. This
message says that we're passing the wrong number of arguments to a
method: zero arguments instead of one argument.

Where did this happen in the code? The following line tells us. If we want more detail about just how we came to this line of code, we can type `wtf` to look at the *stack trace*. (You can also add question marks and exclamation points to get a longer stack trace: `wtf?`, `wtf?!!`, etc.)

```ruby
[9] pry(main)> wtf
Exception: ArgumentError: wrong number of arguments (0 for 1)
--
0: /home/david/Dropbox/app-academy-TA/primes.rb:13:in 'primes'
1: /home/david/Dropbox/app-academy-TA/primes.rb:19:in 'primes'
2: (pry):21:in '__pry__'
3: /home/david/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/pry-0.10.1/lib/pry/pry_instance.rb:355:in 'eval'
4: /home/david/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/pry-0.10.1/lib/pry/pry_instance.rb:355:in 'evaluate_ruby'
[10] pry(main)>
```

The top line of the stack trace tells us what
method (`primes`) and line of code (13) was executing when the error
occured. The next line tells us what called `primes`; it looks like
`primes` calls itself, on line 19. The next line starts with '(pry)';
this is pry executing the code we gave it.

It's certainly odd that primes is calling itself. Let's check this
out:

```ruby
[1] pry(main)> load './primes.rb'
=> true
[2] pry(main)> primes(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 16 Object#primes:

    13: def primes(num_primes)
    14:   debugger
    15:
=>  16:   ps = []
    17:   num = 1
    18:   while ps.count < num_primes
    19:     primes << num if prime?(num)
    20:   end
    21: end
```

Ah. Line 19 says that if `prime?(num)`, then `primes << num`. This tries
to call `primes` again, but what we really wanted was to push `num`
into our list, named `ps`. This is confusing because it's not super
clear that `primes` is calling a method (equivalent to `self.primes`).

Fix this and restart `pry`.

```ruby
[1] pry(main)> load './primes.rb'
=> true
[2] pry(main)> primes(2)

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 16 Object#primes:

    13: def primes(num_primes)
    14:   debugger
    15:
=>  16:   ps = []
    17:   num = 1
    18:   while ps.count < num_primes
    19:     ps << num if prime?(num)
    20:   end
    21: end

[1] pry(main)> c
=> nil
```

Oops. A few more simple bugs. You catch them.

## Step vs Next

Here I have line by-line advanced through `primes`:

```ruby
[1] pry(main)> n

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 19 Object#primes:

    13: def primes(num_primes)
    14:   debugger
    15:
    16:   ps = []
    17:   num = 1
    18:   while ps.count < num_primes
=>  19:     ps << num if prime?(num)
    20:   end
    21: end
```

I could type `n` to execute this line and advance (back to line 19,
actually). But what if I wanted to "step into" the call to `prime?`?
To do this, I use `s` or `step`:

```ruby

[1] pry(main)> s

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 4 Object#prime?:

    3: def prime?(num)
=>  4:   (2...num).each do |idx|
    5:     if num % idx == 0
    6:       return false
    7:     end
    8:   end
    9:
   10:   true
   11: end

[1] pry(main)>
```

This is handy when you want to go down into methods. If I'm no longer
interested in stepping through all of `prime?`, I can finish it and
move up a level by using `finish`:

```ruby
[6] pry(main)> finish

From: /home/david/Dropbox/app-academy-TA/primes.rb @ line 19 Object#primes:

    13: def primes(num_primes)
    14:   debugger
    15:
    16:   ps = []
    17:   num = 1
    18:   while ps.count < num_primes
=>  19:     ps << num if prime?(num)
    20:   end
    21: end
```

## Debugging and Testing

We've gone to a lot of work testing that these methods work as they
should. It would be good if we could record these tests so that they
can be run in the future, to make sure new bugs do not sneak in as we
continue to develop the software. We'll talk later about RSpec, a way
to write tests that can be automatically run by a system called Guard.

When a bug is discovered, good practice is to write a new test that
verifies we don't make that mistake again.

## Resources

* Read this -> [sitepoint][sitepoint]
* Pivotal Labs [cheatsheet][cheatsheet].
* Comprehensive (very long) [debugger documentation][debugger-documentation]

[cheatsheet]: http://pivotallabs.com/ruby-debug-in-30-seconds-we-don-t-need-no-stinkin-gui/
[debugger-documentation]: http://bashdb.sourceforge.net/ruby-debug.html
[sitepoint]: http://www.sitepoint.com/rubyists-time-pry-irb/

# Method Decomposition & Design

## Methods should be atomic

**Each method should do one thing.** A method should do a single,
atomic thing. This may be one line of code, or three, but rarely more
than ten. **Methods should be short.** Let's take a look at an example
of refactoring one long method into short, atomic methods.  We'll use
an implementation of the swingers exercise we worked on in the
[methods][methods] section.

[methods]: ../language-basics/methods.md

Here's the problem description in case you don't remember it:

The method `swingers` should take an array of couples and return a new
array with the couples mixed up. Assume that the first item in the
couple array is a man, and the second item is a woman. An example
input:

```ruby  
swingers([
    ["Clyde", "Bonnie"],
    ["Paris", "Helen"],
    ["Romeo", "Juliet"]
  ])
```

Here's an example of a one-method solution:

```ruby
def swingers(couples)
  men = []
  women = []

  couples.each do |couple|
    men << couple.first
    women << couple.last
  end

  men.shuffle!
  women.shuffle!

  shuffled_couples = []
  men.length.times do
    shuffled_couples << [men.pop, women.pop]
  end

  shuffled_couples
end
```

Let's start breaking this method into smaller methods. What are the
steps that we take in this one super long method?

1. Split the couples into arrays of men and women
2. Shuffle the men and women arrays
3. Zip the two arrays into a (now shuffled) couples array
4. Return the shuffled couples array

Now that we've listed the atomic steps, it will be easy to split the
method into smaller methods. Let's go step by step, and start by
extracting the `split_couples` method:

```ruby
def swingers(couples)
  men, women = split_couples(couples)
  
  men.shuffle!
  women.shuffle!
  
  shuffled_couples = []

  men.length.times do
    shuffled_couples << [men.pop, women.pop]
  end

  shuffled_couples
end

def split_couples(couples)
  men = []
  women = []

  couples.each do |couple|
    men << couple.first
    women << couple.last
  end
  
  [men, women]
end
```

Notice that we're using parallel assignment (aka array destructuring),
here: `split_couples` returns an array with `men` and `women`
subarrays. We use parallel assignment to assign these subarrays to
`men` and `women` variables that are local to the `swingers` method.

Shuffle is already an atomic method, so no need to refactor that step.
Let's extract a method to build the shuffled couples array.

```ruby
def swingers(couples)
  men, women = split_couples(couples)
  
  men.shuffle!
  women.shuffle!
  
  zip_couples(men, women)
end

def split_couples(couples)
  men = []
  women = []
  
  couples.each do |couple|
    men << couple.first
    women << couple.last
   end
   
  [men, women]
end

def zip_couples(men, women)
  couples = []
  
  men.length.times do
    couples << [men.pop, women.pop]
  end
  
  couples
end
```

Notice that the return value of `zip_couples` is the
`couples` array, so we no longer need to explicitly return
`shuffled_couples` in the `swingers` method!

Take a look at the `swingers` method:

```ruby
def swingers(couples)
  men, women = split_couples(couples)
  
  men.shuffle!
  women.shuffle!
  
  zip_couples(men, women)
end
```

**It reads like plain English; hiding away implementation details in
helper methods.** If somebody looks at this code, they will
immediately understand what is going on, even without reading the
definitions of `split_couples` and `zip_couples`. This makes it a lot
easier to understand code.

If they are interested in the implementation of a *specific action*,
they know where to find it: localized to an atomic, helper method.

## Do not use global state

A good general goal is that your methods should be like a mathematical
function: it should take something in and return something. It should
not rely on anything besides what is explicitly passed in, and it
should not have side-effects; it should communicate its result through
the return value.

Some languages are stricter than Ruby: they don't allow you to use any
data except what is passed in as an argument, and they don't let you
change any outside ("global") variables variables, or communicate
outside except through the return value. Ruby is more flexible, but
the majority of methods should be written in this style.

Simply put: **the only way in should be the arguments, the only way out
should be the return value**.

Here's an example of something super terrible:

```ruby
# create a global i variable
i = nil

def square_than_add_two(num)
  i = num
  square
  
  i = i + 2
end

def square
  # get global variable, square it, and reset
  i = i * i
  
  nil
end
```

First, `square` relies on a *global* variable. This should have been
passed in directly. Everything that a method needs should be declared
up-front as a parameter to the method. This makes it easier to know
how to call the method: just pass in the listed arguments.

Second, `square` doesn't return anything useful; instead, it
communicates by setting a global variable. That is unnecessarily
convoluted; just give the answer back directly.

A general guideline: avoid global state. Don't use global variables to
get around passing in arguments or return values.

## Don't modify arguments

Callers do not typically expect you to modify an argument. For
instance:

```ruby
def sum(array)
  result = 0
 
  while array.length > 0
    result += array.pop
  end
 
  result
end
```

This destroys the caller's array. Did he expect this? If modification
of the argument is essential to what you're doing, fine, but otherwise
don't do something potentially unexpected and dangerous like this.

## Resources

* [Wikipedia: Side effect][wiki-side-effects]
* [Destructuring with Ruby][destructuring]

[wiki-side-effects]: http://en.wikipedia.org/wiki/Side_effect_(computer_science)
[destructuring]: http://tony.pitluga.com/2011/08/08/destructuring-with-ruby.html

# Modules

Modules are bundles of methods and constants. The only difference
between a class and a module is that you can't instantiate a module.

Aside: You won't write modules often unless you're writing
libraries/frameworks/etc., but you will see them often, so it's going
to help to know how they work.

## Include vs. Extend

To add the methods defined in your module as instance methods, use `include`. Use `extend` to add the module methods as class methods. Example:

```ruby
module Emotions
  def delight
    puts "Purrr..."
  end
end

class Cat
  include Emotions
end

Cat.new.delight # Purrr...
Cat.delight # NoMethodError: undefined method `delight' for Cat:Class

class Cat
  extend Emotions
end

Cat.delight # Purrr...
Cat.new.delight # NoMethodError: undefined method `delight' for #<Cat:0x007f8cc384f790>
```

Modules also offer initialize hooks that get called when the module is either included or extended.

```ruby
module Emotions
  def self.included(base)
    ...
  end

  def self.extended(base)
    ...
  end
end
```

## Mixins

Ruby doesn't support multiple inheritance. In other words, a class can
only have one parent class. For example, `Array`'s parent class is
`Object`, as is `Hash`'s. But what if we want to add functionality to
both `Array` and `Hash`? They both already have parent classes, so we
can't subclass them. Instead we *mix-in* a module. This is exactly
what the Ruby standard library does with the `Enumerable`
module. Let's see how we would write this:

```ruby
module Enumerable
  def map
    ...
  end
  ...
end

class Array < Object
  include Enumerable
  ...
end

class Hash < Object
  include Enumerable
  ...
end
```

Now all of the methods in the `Enumerable` module (e.g., `map`) are
mixed-in to Array and Hash.

### The power of mixins

Module methods can call methods that are not defined in the module
itself, but are meant to be defined in the class in which the module
will be mixed. Let's give an example:

```ruby
module Enumerable
  def all?(explicit_proc, &implicit_proc)
    if explicit_proc && implicit_proc
      raise "pass either a proc argument or a block; not both!"
    end

    # proc should be set to whichever proc is non-null
    prc = explicit_proc || implicit_proc

    # call each method, which Enumerable doesn't provide, but the
    # class should.
    each do |item|
      return false unless prc.call(item)
    end
    
    true
  end
  
  # many more methods written in terms of each
end
```

This means that if the base class supports a single simple method,
`each`, we can mix in `Enumerable` to get all these powerful methods
like `all?`, `none?`, `map`, etc.

## Namespaces

Namespaces prevent name collisions. Say you have a method `make_bacon`
in file 'A.rb'. Later, you decide to define a method `make_bacon` in
file 'B.rb'. If you're writing a program that `requires` both files,
one is going to overwrite the other and you'll be in trouble.

This is where modules come in; if you wrap the code in 'A.rb' and
'B.rb' in modules, you won't have any difficulty. This is how 'A.rb'
looks:

```ruby
module A
  def make_bacon
    ...
  end
end
```

'B.rb' looks like this:

```ruby
module B
  def make_bacon
    ...
  end
end
```

Let's use A and B in a program to make some bacon.

```ruby
require "A"
require "B"

a_grade_bacon = A.make_bacon
b_grade_bacon = B.make_bacon
```

Yay! Two different kinds of bacon!

It doesn't normally make sense to put your application code inside a
module, but if you want to make your code widely available as a gem,
you would want to wrap it in a module so as to minimize potential
conflicts.

## Resources

* More on [include and extend][include-vs-extend]

[include-vs-extend]: http://rubyquicktips.com/post/1133877859/include-vs-extend

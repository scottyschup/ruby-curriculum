# Metaprogramming and Reflection

**Goals**:

* Learn how to use `send`
* Learn how to use `define_method`
* Learn how to use `method_missing`

## `send` and `define_method`

One of the powers of Ruby is *reflection* (also called
*introspection*): the ability of the program to examine itself.

For instance, we can ask an object what methods it will respond to:

```ruby
1.9.3p194 :002 > Object.new.methods
 => [:nil?, :===, :=~, :!~, :eql?, :hash, :<=>, :class, ...]
```

`Object#methods` returns an array of symbols, each the name of a
method that can be sent to an `Object`. Likewise, we can call a method
by name:

```ruby
1.9.3p194 :003 > [].send(:count)
 => 0
```

When is something like send useful? Why not just call the method the
normal way? Well, using `send` lets us write methods like this:

```
def do_three_times(object, method_name)
  3.times { object.send(method_name) }
end
```

We can even define new methods dynamically:

```ruby
[1] pry(main)> class Golem
[1] pry(main)* end
=> nil
[2] pry(main)> Golem.send(:define_method, :greet) { puts "Golem says hello!" }
=> #<Proc:0x007f96220258b8@(pry):3 (lambda)>
[3] pry(main)> Golem.new.greet
Golem says hello!
=> nil
```

Here we use `Class#send` to cheat and get around the fact that we
cannot call the private method `Class#define_method` from outside the
class; private method protection is not enforced when using
`#send`. We pass `#define_method` a method name, `:greet`, and a
block, which will be the code to execute when the method is called.

It is not an every-day occurrence to use powerful features like this,
but they do come in handy sometime. It is good to be able to
understand them when they do come up. For instance, imagine a class
`User`; say we want to send the `User` any of a number of emails.

```ruby
class User
  def send_welcome_email
    Mailer.welcome_email(self).deliver!
  end

  def send_confirmation_email
    Mailer.confirmation_email(self).deliver!
  end

  def send_threatening_email
    Mailer.threatening_email(self).deliver!
  end
end
```

Imagine the tedium if there were 20 different emails we could
send. We'd like to DRY this up: maybe there should be one
`User#send_email` method which takes an email name. But how would it
call the different `Mailer` methods? We might use reflection:

```ruby
class User
  def send_email(name)
    Mailer.send("#{name}_email", self).deliver!
  end
end

u = User.new
u.send_email(:confirmation) # will call Mailer.confirmation_email...
```

Techniques like this are called *metaprogramming*. A related technique
is to use *macros*. A macro is a method that writes other
methods. Macros are typically helper class methods that are provided
in a parent class or a module which the creator of a derived class
uses to generate code.

Here's an example similar in intent to the previous one, but done a
little differently:

```ruby
module Emailable
  # user calls this to register an email that may be sent
  def register_email(name)
    # we define a method named, e.g., `#send_confirmation_email`
    define_method("send_#{name}_email") do
      # `#send_confirmation_email` calls the appropriate `Mailer`
      # method
      Mailer.send("#{name}_email", self).deliver!
    end
  end
end

class User
  # add Emailable methods as class methods
  extend Emailable

  # next line defines a `send_confirmation_email` method
  register_email(:confirmation)
  
  # some more...
  register_email(:greeting)
  register_email(:unsubscribe)
end
```

It isn't super often that we will define our own macros, but we will
frequently use macros (especially with Rails, where they are heavily
used). If something seems like magical syntax and you wonder where it
came from, you might be looking at a macro.

## `method_missing`

When a method is called on an object, Ruby first looks for an existing
method with that name. If no such method exists, then it calls the
`Object#method_missing` method. It passes the method name (as a
symbol) and any arguments to `#method_missing`.

The default version simply raises an exception about the missing
method, but you may override `#method_missing` for your own purposes:

```ruby
class T
  def method_missing(*args)
    p args
  end
end
```

```ruby
1.9.3p194 :007 > T.new.adfasdfa(:a, :b, :c)
[:adfasdfa, :a, :b, :c]
```

Here's a simple example:

```ruby
class Cat
  def say(anything)
    puts anything
  end

  def method_missing(method_name)
    method_name = method_name.to_s
    if method_name.start_with?("say_")
      text = method_name[("say_".length)..-1]

      say(text)
    else
      # do the usual thing when a method is missing (i.e., raise an
      # error)
      super
    end
  end
end

earl = Cat.new
earl.say_hello # puts "hello"
earl.say_goodbye # puts "goodbye"
```

Using `method_missing`, we are able to "define" an infinite number of
methods; we allow the user to call any method prefixed `say_` on a
`Cat`. This is very powerful. However, overriding `method_missing` can
result in difficult to understand/debug to code, and should not be
your first resort when attempting metaprogramming. Only if you want
this infinite expressability should you use `method_missing`; prefer a
macro if the user just wants to define a small set of methods.

`method_missing` is a cool trick, but I don't know that I've used it
in any of my professional projects. I do know that understanding it
helped me understand how Rails dynamic finders work.

### An advanced example: dynamic finders

Rails, for instance, has a way of finding objects through
`method_missing`:

```ruby
User.find_by_first_name_and_last_name("Ned", "Ruggeri")
User.find_by_username_and_state("ruggeri", "California")
```

Rather than create a method for every single possible way to search
(which is almost infinite), Rails overrides the `#method_missing`
method, and for `find_by_*` methods, it then parses the method name and
figures out how it should perform the search. Here's how it might do
this:

```ruby
class User
  def method_missing(method_name, *args)
    method_name = method_name.to_s
    if method_name.start_with?("find_by_")
      # attributes_string is, e.g., "first_name_and_last_name"
      attributes_string = method_name[("find_by_".length)..-1]

      # attribute_names is, e.g., ["first_name", "last_name"]
      attribute_names = attributes_string.split("_and_")

      raise "unexpected # of arguments" unless attribute_names.length == args.length

      search_conditions = {}
      attribute_names.length.times do |i|
        search_conditions[attribute_names[i]] = args[i]
      end

      # Imagine search takes a hash of search conditions and finds
      # objects with the given properties.
      self.search(search_conditions)
    else
      # complain about the missing method
      super
    end
  end
end
```

## Type introspection

So far we focused on finding, defining, and calling methods at
runtime. We can also find class information:

```ruby
1.9.3p194 :021 > "who am i".class
=> String
1.9.3p194 :022 > "who am i".is_a?(String)
=> true
```

I commonly use `Object#class` when debugging or using pry to see what
kind of thing I'm dealing with, so that I can then know what class to
look up the documentation for.

Here we can see that even classes are objects in Ruby:

```ruby
1.9.3p194 :038 > Object.is_a?(Object) # whoa: meta
=> true
```

Deep. Let's dig deeper:

```ruby
1.9.3p194 :008 > Object.class
=> Class
```

Okay, all classes are instances of a `Class` class.

```ruby
1.9.3p194 :009 > Class.superclass
=> Module
1.9.3p194 :010 > Class.superclass.superclass
=> Object
```

Classes are types of `Module`s (not important), which are
`Object`s. In Ruby everything is an `Object`, even `Class`es!

To summarize: `Object` is of type `Class`, which is a subclass of
`Object` itself. Whoa!

## Type introspection for fun and profit

Say we have written a method `perform_get` that fetches a resource
over the internet. As a convenience to the user, we'd like
`perform_get` to take either a `String`, which is the literal URL to
fetch, or a hash, with a the URL broken into parts

```ruby
perform_get("http://www.google.com/+")
perform_get(
  :scheme => :http,
  :host => "www.google.com",
  :path => "/+"
)
```

How might this work? Perhaps like so:

```ruby
def perform_get(url)
  if url.is_a?(Hash)
    # url is actually a hash of url options, call another method
    # to turn it into a string representation.
    url = make_url(url)
  end
  
  # ...
end
```

This is a quite common trick used by library writers to make their
methods much more flexible. You may not write a method like this
often, but as you grow more experienced, this kind of trick will come
in handy from time to time.

## Exercises
Estimate time: .25hrs

* Ruby Monk: [Metaprogramming Ruby](http://rubymonk.com/learning/books/2).

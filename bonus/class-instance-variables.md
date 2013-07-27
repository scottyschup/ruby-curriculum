# Class Instance Variables

You know all about instance variables:

```ruby
class Dog
  def initialize(name)
    @name = name
  end

  # could also use `attr_reader :name`
  def name
    @name
  end
end
```

Inside a method, we can set an instance variable of the current
object. This is what we do inside the `initialize` instance method.

Recall that classes are objects, too. For instance, `Dog` itself is a
class. We can set instance variables on the `Dog` class object too:

```ruby
class Dog
  def self.all
    @dogs ||= []
  end
  
  def initialize(name)
    @name = name
    
    self.class.all << self
  end
end
```

In the class method `all`, we fetch/assign an instance variable
`dogs`. This stores an instance variable in the `Dog` object. As part
of the initialization of a `Dog` instance, we add the `Dog` instance
to the list of all `Dog`s. We can access all dogs through `Dog.all`:

```ruby
d1 = Dog.new("Fido")
d2 = Dog.new("Fido 2.0")

p Dog.all
=> [#<Dog:0x007fe140a23928 @name="Fido">,
 #<Dog:0x007fe140a628d0 @name="Fido 2.0">]
```

Note that the `@dogs` variable in `Dog.all` works the same as any
other instance variable: setting or accessing `@dogs` will look inside
the current object (in this case, the `Dog` class object) and
set/fetch the instance variable.

When an instance variable is stored on a class, it is sometimes called
a **class instance variable**. Don't let the name wow you though;
we're just using a typical instance variable. This is similar to how
class methods are mereley methods that are called on a `Class` object.

## `@@`

For our purposes, the standard instance variable will typically be
enough. There is one downside: class instance variables work weird in
the context of inheritance.

Let's take an example:

```ruby
class Corgi < Dog
end
```

Let's think what happens when we run `Corgi.new("Linus")`. Per the
definition of `initialize` in `Dog`, we will run `self.class.all <<
self`. `self.class` is `Husky`; `Husky` will have an `all` method by
virtue of inheriting from `Corgi`.

The `all` method will look in `Corgi` for a `@dogs` instance
variable. Note that `Corgi` will not share the `@dogs` variable from
`Dog`. `Corgi` and `Dog` are different objects, so they do not share
instance variables.

This means that `Corgi` will have its own `@dogs` variable, and
`Corgi`s will not be added to the `Dog`'s array of `@dogs`.

That may not be what you want. Perhaps you would like that `Corgi`s be
added to the list of all `Dog`s. You can do this by switching from
`@dogs` to `@@dogs`.

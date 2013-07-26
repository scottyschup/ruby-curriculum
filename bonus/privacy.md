# Privacy

## `Public`, `Private`, `Protected`.

You may have seen the keywords `public`, `private`, and `protected`
in class definitions like so:

```ruby
class Cat
   public
   def meow
      puts "meow"
   end

   private
   def thoughts
      ...
   end

   protected
   def clean
      ...
   end
end
```

### `Public`

From [Ruby-Doc][ruby-doc-protected] (on Access Control):

> * *Public methods* can be called by anyone---there is no access
> control. Methods are public by default (except for initialize, which
> is always private).

There's not much to say here. But note that as `public` is the
default, we didn't actually have to explicitly specify that `#meow`
was public.

### `private`

> * *private methods* cannot be called with an explicit
> receiver. because you cannot specify an object when using them,
> private methods can be called only in the defining class. [...]

Say we have some class with a private method `#private_thing`.

```ruby
class MyClass
   private
   def private_thing
      puts "Hello World"
   end

   public
   def explicit_receiver
      self.private_thing
   end

   def implicit_receiver
      private_thing
   end
end
```

What do you expect `#explicit_receiver` and `#implicit_receiver` to
return?

```ruby


```
* no explicit receiver, even self!
* okay if defined in superclass

### `Protected`
> * *Protected methods* can be invoked only by objects of the defining
> class and its subclasses. Access is kept within the family.


* can have explicit receiver so long as it has same class as self, or is superclass of self.

### They're methods!

If you see this,

```ruby
class Cat
   private
   def thoughts
      ...
   end

   def meow
      puts "meow"
   end
end
```

and think that `#meow` is public. You will be surprised to find that:

```ruby
> Cat.new.meow
NoMethodError: private method `meow' called for #<Cat:0x007f9bda076278>
```

In the above example, both `thoughts` and `#meow` are private. This is
because access modifiers like `private` continue until either the end
of the class definition or another access modifier. So we would be
better off putting in another access modifier like this:

```ruby
class Cat
   private
   def thoughts
      ...
   end

   public
   def meow
      puts "meow"
   end
end
```

Or better yet, just defining `#meow` before `#thoughts` and the
`private` keyword, as methods are public by default.

[ruby-from-other-lang]:http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/

[ruby-doc-protected]: http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_classes.html

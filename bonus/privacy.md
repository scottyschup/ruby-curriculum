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
do?

```
> thing = MyClass.new
 => #<MyClass:0x007fe2612ccae0>
> thing.implicit_receiver
Hello World
 => nil

> thing.explicit_receiver
 NoMethodError: private method `private_thing' called for #<MyClass:0x007f9cfa064200>
```

So not even `self` is okay as the explicit receiver! Note that private
methods are inherited. So if we were to say:
```
class MyOtherClass < MyClass
   def implicitly_inherited
      private_thing
   end
end

# in irb

> thing2 = MyOtherClass.new
> thing2.implicitly_inherited
Hello World
 => nil
```


### `Protected`
> * *Protected methods* can be invoked only by objects of the defining
> class and its subclasses. Access is kept within the family.

So protected methods can be called with an explicit receiver, so long
as the caller is of the same class or subclasses.

```ruby
class Dog
  def hear_whistle(dog)
    dog.whistle
  end
  def hear_woof(dog)
    dog.woof
  end

  protected
  def whistle
    puts "whistle"
  end
end

class Beagle < Dog
  protected
  def woof
    puts "woof"
  end
end

# in irb

> dog = Dog.new
> beagle = Beagle.new

> beagle.hear_whistle(dog)
whistle

> dog.hear_woof(beagle)
protected method `woof' called for #<Beagle:0x007fb3a1928518> (NoMethodError)
```

### Using Access Controls

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

and think that `#meow` is public. You will be surprised to see:

```ruby
> cat = Cat.new
 => #<Cat:0x007fe26094bae8>

> cat.meow
NoMethodError: private method `meow' called for #<Cat:0x007f9bda076278>
```
#### They Act 'till the End of Scope!

In the above example, both `thoughts` and `#meow` are private. This is
because access modifiers like `private` continue either until the end
of the class definition or until they hit another access modifier. Thus
we need to specify that `#meow` is public.

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

#### Not Secure

Note that these access modifiers are *not* for security. In fact,
they're super easy to subvert. Check it out:

```ruby
class Cat
   private
   def meow
      puts "meow"
   end
end

# in irb:
> cat = Cat.new

> Cat.new.meow
NoMethodError: private method `meow' called for #<Cat:0x007feafb40a1f8>

> Cat.new.send(:meow)
meow
 => nil
```

We'll cover `#send` another day, but all you need to know is that it's
easy to subvert the private access control. Instead of security, you
should be using access controls to choose how users will interact with
your classes.

[ruby-from-other-lang]:http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/

[ruby-doc-protected]: http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_classes.html

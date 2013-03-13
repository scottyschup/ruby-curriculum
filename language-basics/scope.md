# Scope

Scope is the context in which a variable name is valid and can be
used.

A name is *in scope* (accessible) if

- the name has been previously defined in the current method (called a
  *local variable*), OR
- the name has been previously defined at the same or higher level of
  the current method.
- A new level starts whenever we begin a class, a method, or a block.

We can't use a variable before it is defined:

```ruby
def pow(base, exponent)
  i = 0
  while i < exponent
    # Error: result is being used before it has been defined.
    result = result * base

    i += 1
  end
  
  result
end
```

We can't use a variable from a deeper scope. In the below example,
`cat_age` is defined inside `extract_cat_age` and not available at the
top-level scope.

```ruby
# defines a cat variable name in the global scope
cat = {
  :name => "Breakfast",
  :age => 8
}

def extract_cat_age
  # creates a new local variable inside this method; won't add
  # variable to global scope; variable will be lost when method is
  # over
  
  cat_age = cat[:age]
end

extract_cat_age
cat_age # ERROR: variable out of scope
```

Sometimes things are subtle. 

```ruby
def fourth_power(i)
  # wait, isn't square not defined yet?
  square(i) * square(i)
end

def square(i)
  i * i
end

# Ah, but by the time we _call_ `fourth_power` and run the
# interior code, `square` will have been defined
fourth_power(2)
```

## Global variables
***note*** This last bit about global variables is not essential.
So, while you shouldn't typically create global variables, you can do so with `$`.
If you remember the trick to run a special `main()`-ish method in ruby: 

```
if __FILE__ == $PROGRAM_NAME
  # Put "main" code here
end
```
Here `$PROGRAM_NAME` is an example of a special global variable which has an ever expansive scope. 
Even if you're loading in the contents of a library, you'll still have access to the `$`-globals.
See [this link][rubyist-global-vars].
[rubyist-global-vars]: http://www.rubyist.net/~slagell/ruby/globalvars.html

## Credit

[Wikipedia: Scope][wiki-scope]

[wiki-scope]: http://en.wikipedia.org/wiki/Scope_(computer_science)

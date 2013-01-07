# Strings

## Goals

* Familairize yourself with the selected, important methods here.
* Know how to use string interpolation and to prefer it to
  concatenation.

## Quotes

Strings are how we represent text in Ruby. We need to protect the text
from the Ruby interpreter so it doesn't think our text is actually
code:

```ruby
> these are some words
NameError: undefined local variable or method `words' for main:Object
        from (irb):6
        from /Users/ruggeri/.rvm/rubies/ruby-1.9.3-p194/bin/irb:16:in `<main>'
```

Uh oh.

```ruby
> "these are some words"
 => "these are some words"
```

Better. We protect text with quotes. You may use either single or
double quotes:

```ruby
'letters' == "letters" # => true
```

When to use which? If your text includes a quotation mark, you may
want to use the opposite form of quotes:

```ruby
'"Yesterday" has been covered >2,200 times'
"I didn't know that!"
```

## Interpolation

It is very common to build up strings from other strings.

```ruby
worst_day = "Monday"
"#{worst_day}s are the hardest."
# => "Mondays are the hardest."
```

This technique is called *string interpolation*. Inside the `#{}`, you place
ruby code; the code is executed, and the return value is inserted
inside the string.

The code inside the `#{}` should be very short; just one variable plus
maybe a single method call; that keeps things easy to read and
understand. Otherwise, first save the result in a temporary variable,
then interpolate that:

```ruby
MURDER = "redrum".reverse.upcase
"#{MURDER}! #{MURDER}!"
```

String interpolation can only be done with double quotes (""), and
doesn't work with single quotes (''). For this reason, as well as
because single quotes don't support as many
[escape sequences](http://en.wikibooks.org/wiki/Ruby_Programming/Strings#Escape_sequences),
double quotes are the preferred default.

## Concatenating and appending to strings

Interpolation is usually the idiomatic, clean way to build up
strings. Sometimes you'll want more power. Strings have methods that
correspond to array's `<<` and `+` methods: For example:

```ruby
likes = "race cars, lasers, aeroplanes"
dislikes = "harmonicas"

"I like " + likes + ". I don't like " + dislikes + "."
# => "I like race cars, lasers, aeroplanes. I don't like harmonicas."
```

You'd probably prefer string interpolation here, but concatenation is
an option. And not true: harmonicas are cool.

As with arrays, it's common to want to grow strings by appending to
them. You could do this like so:

```ruby
count_in = ""
count_in = count_in + "One, "
count_in = count_in + "two, "
# ...
```

It is preferred to use the shovel (`<<`) operator for this; you'll
look cooler:

```ruby
count_in = ""
count_in << "One, "
count_in << "two, "
# ...
```

## Accessing a substring

You can access substrings of a string much like you can access
subarrays of an array.

```ruby
"this is my sentence"[5..6]
# => "is"
```

Here five is the starting position of the substring, and two is the
substring's length. As with arrays, you may also pass a range.

## Length

To count the number of characters in a string, use the `length`
method:

```ruby
"words words words".length
# => 17
```

## Split a string into parts

It is common to want to split a string into an array of parts. For
instance:

```ruby
ice_creams = "Bi-Rite, Humphrey Slocum, Mitchell's"
ice_creams.split(", ")
#=> ["Bi-Rite", "Humphrey Slocum", "Michell's"]
```

## Other Killer `String` Methods

Read up on 'em all:

* [`#chomp`][chomp-doc]/[`#strip`][strip-doc]
* [`#gsub`][gsub-doc]
* [`#downcase`][downcase-doc]/[`#upcase`][upcase-doc]
* [`#to_i`][to_i-doc]
* [`#to_sym`][to_sym-doc]
* [`#*`][times-doc]

[chomp-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-chomp
[strip-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-strip
[gsub-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub
[downcase-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-downcase
[upcase-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-upcase
[to_i-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-to_i
[to_sym-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-to_sym
[times-doc]: http://www.ruby-doc.org/core-1.9.3/String.html#method-i-2A

## Exercises

Estimated time: 1hr

* Write a method that takes an int and builds up a string representing
  it.
  * Write a version that will build the binary version.
  * Write a version that builds an octal version.
  * Write a version that creates a string for a given base.
  * NB: 10.to_s(base) already does this, but try it for youreslf!
  
* Implement a [Caesar cipher](http://en.wikipedia.org/wiki/Caesar_cipher).
  Example: `caesar("hello", 3) # => "khoor"`

## Resources
http://www.ruby-doc.org/core-1.9.3/String.html

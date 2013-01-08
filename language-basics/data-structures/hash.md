# Hash

## Goals

* Familiarize yourself with the selected, important methods here.
* Know that a `Hash` should be used whenever you have keys and values.
* Know:
  * how to access a value by key
  * how to set a value for a key

## What's a Hash?

A Hash is a collection of key-value pairs. You can think of a hash like an
array, but instead of the keys being incrementing integer indices (i.e., 0, 1,
2, 3, etc.), the keys are arbitrary, and can be any kind of object.

You can create a hash a couple different ways:

```ruby
empty_hash = Hash.new
another_empty_hash = {} # shorter and preferred

capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }
```

### `Hash#[]`

We can look up values in a hash by its key:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }
capitals['New York'] # => 'Albany'
```

### `Hash#.each`

We can also *iterate* over the elements of the hash, just like we did
with array:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }

elements.each do |state, capital|
  puts "#{capital} is the capital of #{state}"
end

# => Albany is the capital of New York
#    Sacramento is the capital of California
```

Notice that when we iterate over a hash, each entry in the hash has
both a key and a value.

### `Hash#[]=`

We add a new key and value to a hash like so:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }
capitals['Texas'] = 'Austin'

puts capitals
# => { 'New York' => 'Albany', 'California' => 'Sacramento', 'Texas' => 'Austin' }
```

### `Hash#merge`

We can also merge two hashes together:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }
more_capitals = { 'Texas' => 'Austin', 'Alaska' => 'Fairbanks' }

capitals.merge(more_capitals)
# => { 'New York' => 'Albany', 'California' => 'Sacramento', 'Texas' => 'Austin', 'Alaska' => 'Fairbanks' }
```

Notice that `hash1.merge(hash2)` is the same as `hash2.merge(hash1)`
here. This isn't always the case; if you have two hashes with the same
keys, duplicate entries in the merged Hash take precedence over the
ones in the calling Hash:

```ruby
h1 = {:a => 'apple', :b => 'bat'}
h2 = {:b => 'bravo', :c => 'charlie'}

h1.merge(h2) # => {:a => 'apple', :b => 'bravo', :c => 'charlie'}    
```

Note also that `merge` does not modify either of the hashes, it
creates a new hash which contains the keys and values of both. There
is a bang version (`merge!`) which will modify the hash.

### `Hash#keys`

If we want to get all of the keys in a hash we can use the `keys`
method:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }

capitals.keys # => ['New York', 'California']
```

Notice that the return value of this method is an *array* of the
hash's keys.

### `Hash#values`

Similarly, we can get all of the values in a hash by using the
Hash#values method:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }
capitals.values # => ['Albany', 'Sacramento']
```

### `Hash#has_key?`

We can check if a hash has a specific key by using the `Hash#has_key?`
method:

```ruby
capitals = { 'New York' => 'Albany', 'California' => 'Sacramento' }
capitals.has_key('New York') # => true
capitals.has_key('France') # => false
```

## Exercises

Estimated time: 30min

### Set

Ruby provides a class named `Set`. You can read all about it in the
[ruby-doc][ruby-doc]. Let's make a set of methods that will manipulate
a `Hash` as if it were a `Set`.  Like so:

```ruby
set_add_el({}, :x) == {:x => true}
set_add_el({:x => true}, :x) == {:x => true} # don't re-add
set_remove_el({:x => true}, :x) == {}
set_list_els({:x => true, :y => true}) == [:x, :y]
set_member?({:x => true}, :x) == true
set_union({:x => true}, {:y => true}) == {:x => true, :y => true}
set_intersection
set_minus
```

[ruby-doc]: http://www.ruby-doc.org/stdlib-1.9.3/libdoc/set/rdoc/Set.html

## Resources

* [RubyDoc for Hash](http://www.ruby-doc.org/core-1.9.3/Hash.html)

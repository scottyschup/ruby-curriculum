* ==
    * Most fundamental of comparisons.
    * Used to check if two objects have the same value. So it is your
      chance as the class author to decide what it means for two
      instances of your class to be equal.
    * `#==` is inherited from the Object class. By default, it checks
      to see if the two objects it is comparing are the same
      instance. It's default behavior is not very helpful, you should always
      override it.
* eql?
    * `#eql?` is another generic equality comparison like `#==`. For
      some classes it acts identically to `#==` however, sometimes it
      has a slightly different behavior.
    * With numeric types, `#==` performs type conversion (_e.g._
      `Fixnum` to `Integer`), but `#eql?` does not.
      ```ruby
      3.0 == 3 #=> true
      3.0.eql? 3 #=> false
      ```
    * `#eql?` is used by `Hash` to check if a value is a key in a hash.
      ```ruby
      silly_hash = { 3 => 'the third' }
      silly_hash[3.0] #=> nil
      silly_hash[3] #=> 'the third'
      ```
* equal?
    * same object, this is identity comparison (or pointer
      comparison). `a.equal? b` if and only if `a` is the same
      instance as `b`.
    * Same behavior as `#==` for the `Object` class.
* ===
    * case equality.
    * Defaults to the same behavior as `#==` for classes that you write.
    * Override if you want to add cool `case`/`when` behavior to your class.
    * Example: Integer === 3
    * Example: Regex
* hash (and eql?)


[so-equality]: http://stackoverflow.com/a/7157051
[object-doc]: http://ruby-doc.org/core-2.0/Object.html
[regex-case]: http://stackoverflow.com/a/1735777

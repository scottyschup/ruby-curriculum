# Recursion

## Goals

* Know the difference between iteration and recursion.

## Recursive methods

A *recursive* method is one that calls itself. Each time the method
calls itself, it tries to solve a smaller *subproblem*. Think of this
as breaking a large problem into smaller problems. Each of these may
be divided again into still smaller subproblems.

The subproblems keep getting smaller and smaller, until they are small
enough to solve trivially and directly. These small subproblems are
called *base cases*.

The factorial operation is one example of a problem that can be solved
recursively. Recall that five factorial is:

    5! = 5 * 4 * 3 * 2 * 1
    n! = n * (n - 1) * (n - 2) * ... * 1

We can also define factorial *recursively*:

    1! = 1
    n! = n * (n - 1)!

The first equation is the base case: `1!` is, trivially, `1!`. For any
`n > 1`, we can use the second equation to break the problem into a
smaller one.

Let's implement this recursive definition:

```ruby
def factorial(n)
  if n == 1 # the base case
    1
  else # the recursive case
    n * factorial(n - 1)
  end
end
```

Let's walk through how this method is evaluated for `factorial(3)`

```ruby
factorial(3)
=> 3 * factorial(2)
=> 3 * 2 * factorial(1)
=> 3 * 2 * 1
=> 6
```

## Recursion vs iteration

Recursive methods can always be written *iteratively*: using loops
and no recursion. Let's try our hand at the factorial method:

```ruby
def factorial(n)
  result = 1
  (1..n).each do |i|
    result *= i
  end
  
  result
end
```

In fact, any recursive method can always be written
iteratively. However, the iterative form can sometimes be
significantly more complicated. When choosing whether to solve a
problem recursively or iteratively, you should think about which
solution is more natural to your own mind.

## Exercises

Estimated time: 5hrs

* Test First Ruby XML parser
* Write the following methods both recursively and iteratively
  * fibonacci
  * sum of an array
  * binary search: bsearch(array, target)
  * exponent
* make change (http://www.rubyquiz.com/quiz154.html)
  * Whenever we assign a Ruby Quiz, after solving it, make sure to
    look at a couple answers and make sure you understand them.

Write two versions of exponent that use two different recursions:

```ruby
exp(b, 0) = 1
exp(b, n) = b * exp(b, n - 1)

exp(b, 0) = 1
exp(b, 1) = b
exp(b, n) = exp(b, floor(n / 2)) * exp(b, ceil(n / 2))
```
Which one do you think runs more quickly?

* Implement a method, `merge_sort` that sorts an `Array`
  * if there is zero or one elements in the array, do nothing, it is
    already sorted
  * else split the array in two
    * the halves should be as near to equal in length as possible
      * you may wish to use `take`/`drop`
    * recursively sort each of these subarrays
    * "merge" the two sorted subarrays into one
      * use a while loop which runs as long as one of the subarray has
        any elements
      * if both subarrays still have elements
        * compare the fronts of the subarrays
        * `shift` the smaller of the two, `push`ing it into the merged
          array
      * else, just `shift` the element of the non-empty list and
        `push` it into the merged array

## Resources

* [Wikipedia: Recursion][wiki-recursion]

[wiki-recursion]: http://en.wikipedia.org/wiki/Recursion_(computer_science)

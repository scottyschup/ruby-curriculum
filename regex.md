# Regular Expressions

**TODO: Zed Shaw has rewritten a lot of his regex book; this section
  needs to be rewritten**

*Regular Expressions* (or *regex*) are a symbolic language used to
*match* (specify and recognize) strings of text, such as particular
characters, words, or patterns of characters.

We'll use Zed Shaw's [Learn Regex the Hard Way][zed-regex] to learn
regex. The book is incomplete, but we'll only being using Ch01 -
Ch17. Make sure to do all the exercises and extra-credit
sections. Here are some points to keep in mind as you read the book:

Regetron (Zed Shaw's Regex tool) can be a bit buggy; often restarting
regetron and reloading the corpus does the trick.

* Chapter 1
 * Install regetron from source instead of through pip
* Chapter 2
 * 2.2.5 Even though you don't know Python, you should be able to read
Regetron's source and understand most of what's going on.
* Chapter 7
 * 7.2 Don't even think about skipping this :)
* Chapter 8
 * 8.5 For Rails, you'll find the relevant code in
'rails/actionpack/lib/action_dispatch/routing/mapper.rb'
* Chapter 11
 * Zed Shaw doesn't have the best exposition on "non-greedy". See the [relevant section on Wikipedia](http://en.wikipedia.org/wiki/Regular_expression#Lazy_quantification) for a better one.

## Exercises

1. All the words that begin with the letter a, independent of case (17096 words)
2. All the words that contain the sequence 'ing' (8852 words)
3. All the words end in the sequence 'ing' (5539 words)
4. All the words exactly 7 letters long (23869 words)
5. All words with two adjacent 'a's (124 words)
6. All words that end in either 'vark' or 'wolf' (8 words)

## More resources
* [Regex-info](http://www.regular-expressions.info/)
* [Rubular: a Ruby regex tool](http://rubular.com/)
* http://regexone.com/

[zed-regex]: http://regex.learncodethehardway.org/book/

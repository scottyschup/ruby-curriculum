# Word Chains

Read the [RubyQuiz][quiz]. It may be down, in which case use the
WaybackMachine.

+ Hint: first write a method `adjacent_words` which gives an array
  of all words "one letter away".
+ Start with the starting word. Get all the adjacent words; check to
  see if your target word is among them.
+ If not, then take your set of adjacent words, and "grow" more
  reachable words by calling `adjacent_words` on the current set of
  words. Repeat.
+ Keep track of the words you've visited previously; make sure not
  to revisit them.
+ To be able to rebuild a chain, each time you encounter a new word,
  record the word that was one step before.

[quiz]: http://www.rubyquiz.com/quiz44.html

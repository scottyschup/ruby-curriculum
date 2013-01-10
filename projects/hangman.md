# Hangman

In this project, we write a program to play [Hangman][wiki-hangman].

You should have two modes. In the first mode, the computer player
should read in a [dictionary file][dictionary-files]. It should choose
one randomly. Interaction should look something like so:

    Secret word: _____
    > h
    Secret word: h____
    > l
    Secret word: h_ll_
    > z
    Secret word: h_ll_

Next, write the program to let the user pick a word; they only need to
put in how long it is. The computer should, using its dictionary,
start guessing. It should try to be smart and guess letters in words
of the right length, and which match the currently known letters.

Your computer should guess somewhat intelligently. First narrow the
dictionary down to the set of possible words. A fair strategy is to
guess the most frequent letter in the subset of posisble words.

[wiki-hangman]: http://en.wikipedia.org/wiki/Hangman_(game)
[dictionary-files]: http://wordlist.sourceforge.net/

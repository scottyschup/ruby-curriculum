# Chess

Write a [chess game][wiki-chess] in an object-oriented way.

There are many different kinds of pieces in chess, and each moves a
specific way. How will you organize all of these different ways to
move?

A valid move also should not leave your king in check. Should the code
to check this be in every one of your piece classes?

Likewise, you'll have to write logic that determines whether the game
is won (you may ignore draws, for simplicity's sake).

Some kind of `Game` class should keep track of who's move it is, as well
as the board, etc.

You should not "bake in" the logic to prompt for a move into the game
class. You should first write a `HumanPlayer` class, but when finished
with the rest of the assignment write a `ComputerPlayer` class that
will employ some rudimentary logic. Your first AI should be to just make a
random (legal) move. Think of simple improvements upon this.

[wiki-chess]: http://en.wikipedia.org/wiki/Chess

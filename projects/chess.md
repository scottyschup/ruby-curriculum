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
class; those concerns should be separated. You will want to write a
`HumanPlayer` class. Don't implement a `ComputerPlayer`, but your
design should allow that to be easily added at a later date.

**Note**: Do not concern yourself with tricky moves like "en
passant". Likewise, don't implement castling, draws, or pawn
promotion; if you finish early work on other things. You should handle
check and check mate, however.

[wiki-chess]: http://en.wikipedia.org/wiki/Chess

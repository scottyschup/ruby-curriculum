# Chess

Write a [chess game][wiki-chess] in an object-oriented way. **Please
read all through the various phases before proceeding.**

## Phase I: Pieces

There are many different kinds of pieces in chess, and each moves a
specific way. Based on their moves, they can be placed in three categories:

0. Sliding pieces (Bishop/Rook/Queen)
0. Stepping pieces (Knight/King)
0. The pawn (do this last)

Start by writing a `Piece` parent class which contains the
functionality common to all pieces. A key method of `Piece` is
`#moves`, which should return an array of places a `Piece` can move
to. Of course, every piece will move differently, so you can't write
(**implement**) the `#move` method of `Piece`.

You can make subclasses for `SlidingPiece` and `SteppingPiece`. The
`SlidingPiece` class can implement `#moves`, but it needs to know what
directions a piece can move in (diagonal, horizontally/vertically,
both). A subclass of `SlidingPiece` (`Bishop`/`Rook`/`Queen`) will
need to implement a method `#move_dirs`, which `SlidingPiece#moves`
will use.

Your `Piece` will need to (1) track its position and (2) hold a
reference to the `Board`. The `SlidingPiece` in particular needs the
`Board` so it knows to stop sliding when blocked by another piece.

For now, do not worry if a move would leave a player in check.

## Phase II: `Board` and `Board#check(color)`

Your `Board` class should hold a 2-dimensional array (an array of arrays). 
Each position in the board either holds a `Piece`, or `nil` if no piece 
is present there.

The `Board` class should have a method `#checked?(color)` that returns
whether a player is in check. You can implement this by (1) finding
the position of the king on the board then (2) seeing if any of the
opposing pieces can move to that position.

The `Board` class should have a `#move(start, end)` method. This
should update the 2d grid and also the moved piece's position. You'll
want to raise an exception if: (a) there is no piece at `start` or (b)
the piece cannot move to `end`.

## Phase III: `Piece#valid_moves`

You will want a method on `Piece` that filters out the `#moves` of a
`Piece` that would leave the player in check. A good approach is to 
write a `Piece#move_into_check?(pos)` method that will:

0. For each move, duplicate the `Board` and perform the move.
0. Look to see if the player is in check after the move
   (`Board#check`).

To do this, you'll have to write a `Board#dup` method. Your `#dup`
method should duplicate not only the `Board`, but the pieces on the
`Board` (why?).

Note that another way to write `#valid_moves` would be to make the
move on the original board, see if the player is in check, and then
"undo" the move. However, this would require that `Board` have a
method to undo moves. It's typically more straightforward to avoid
undoing things.

Modify your `Board#move` method so that it only allows you to make
valid moves. Because `Board#move` needs to call `Piece#valid_moves`,
`#valid_moves` must not call `Board#move`. But `#valid_moves` needs to
make a move on the duped board to see if a player is left in
check. For this reason, write a method `Board#move!` which makes a
move without checking if it is valid.

`Board#move` should raise an exception if it would leave you in check.

## Phase IV: `Board#checkmate?(color)`

Write a `#checkmate?` method. If the player is in check, and if none
of the player's pieces have any `#valid_moves`, then the player is in
checkmate.

## Phase V: `Game`

Only when done with the basic Chess logic (moving, check, checkmate)
should you begin writing user interaction code.

Write a `Game` class that constructs a board, that alternates between
players (assume two human players for now) prompting them to move. The
`Game` should handle exceptions from `Board#move` and report them.

It is fine to write a `HumanPlayer` class with one method (`#play_turn`). 
In that case, `Game#play` method just continuously calls `play_turn`.

It is not a requirement to write a `ComputerPlayer`, but you may do 
this as a bonus. If you write your `Game` class cleanly, it should be 
relatively straightforward to add new player types at a later date.

## Notes

* Do **not** concern yourself with tricky moves like "en
  passant". Don't implement castling, draws, or pawn promotion. You
  **should** handle check and check mate, however.
* Once you get some of your pieces moving around the board, **call
  over your TA for a code-review**.
* Here's a four-move sequence to get to checkmate from a starting
  board for your checkmate testing:
  * f2, f3
  * e7, e5
  * g2, g4
  * d8, h4

[wiki-chess]: http://en.wikipedia.org/wiki/Chess

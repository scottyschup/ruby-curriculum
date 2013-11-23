# Tic-tac-toe AI

Let's extend your tic-tac-toe AI player so that is is unbeatable!

## Phase I: `TicTacToeNode`

Let's create a class `TicTacToeNode`. This will represent a TTT
game-state: it will store the current state of the `board` plus the
`next_player` to move. Also, if given, store the `prev_move_pos` (this
will come in handy later).

You don't have to reuse your previous `TreeNode` class for this.

Write a method `children` that returns nodes representing all the
potential game states one move after the current node.

Next, we want to characterize a node as either a
`#losing_node?(player)` or `#winning_node?(player)`. A `#losing_node?`
means:

* The board is over and the opponent has won, OR
* It is the player's turn, and all the children nodes are losing
  boards for the player, OR
* It is the opponent's turn, and one of the children nodes is a
  losing board for the player.

Likewise, a winning node means either

* The board is over and the player has won, OR
* It is the player's turn, and one of the children nodes is a winning
  board for the player, OR
* It is the opponent's turn, and all of the children nodes are
  winning nodes for the player.

Notice that `winning_node?` and `losting_node?` do a recursive search
in the tree, but that neither is DFS or BFS exactly. That's cool; we
can use trees outside of BFS/DFS.

## Phase II: `SuperComputerPlayer`

Write a subclass of `ComputerPlayer`; we'll override the `#move`
method to use our `TicTacToeNode`.

In the `#move` method, build a `TicTacToeNode` from the current
board. Next, iterate through the children. If there is a winning node,
pick that move. Else, try to avoid a losing node.

Run your TTT game with the `SuperComputerPlayer`. Make sure you can
never win!

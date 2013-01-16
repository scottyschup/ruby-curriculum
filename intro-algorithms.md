# Intro to Algorithms and Data Structures

## Goals

* Know what an algorithm is.
* Know what a data structure is.
* Know what a tree is.
  * Know what DFS and BFS are

This class won't focus heavily on abstract algorithms: we will not
become experts in every algorithm under the sun. We are going to cover
the basic algorithms that *will* prove useful in your career.

Coding up algorithms is a good way to practice the skills we've been
learning. It gives you practice thinking like a programmer. Given a
description of an algorithm, you should be able to translate that into
Ruby code. That's our primary goal in this chapter.

## Trees

Ruby provides an Array class which is a "linear" collection of
elements. But there are other ways to represent collections and
organize data.

*Trees* store data in a *hierarchy* of layers. An element, or *node*
at each layer can have links to lower level nodes. One simple example
is a file system:

* /
    * Users
        * ruggeri
            * Desktop
            * Documents
            * Downloads
        * patel
            * Desktop
            * Downloads
  * System
        * Library

The top-level *node* is called the *root*. Each node can hold a value:
here the root holds '/'. The *children* of a node are the nodes one
level deeper. The children of the 'Users' node hold 'ruggeri' and
'patel'. The lowest level nodes (the ones with no children) are called
*leaves*.

In general, nodes can have any number of children. In the special case
of *binary trees*, nodes can have at most two children. These children
are called the *left* and *right* children.

An array and a tree are two kinds of *data structures*. A data
structure is a way of storing and organizing data in a computer so
that it can be used efficiently. Depending on how you will use the
data, different data structures may be appropriate.

## Depth First Search (DFS)

Given a tree, we may wish to enumerate all the values held by nodes in
the tree. For instance, we may wish to go through the files/folders of
the tree and print each one.

One common way to traverse (i.e., visit all the nodes) a tree is depth
first search. The nodes are numbered in the order that we visit them:

          1
         / \
        2   5
       /   / \
      3   6   9
     /   / \
    4   7   8

Each time, we try to visit the left child, if it exists and hasn't
been visited yet. If it has, we try to visit the right child, if it
exists and hasn't been visited yet. If all the children have been
visited, then we move up one level and repeat.

### Breadth first search

Breadth first search is an alternative to depth-first search.

          1
         / \
        2   3
       /   / \
      4   5   6
     /   / \
    7   8   9

Here we visit a node, then each of its children, then each of their
children, etc.

An advantage of breadth-first search is that it considers shallower
nodes before deeper ones.

### Algorithm

DFS and BFS are *algorithms*. An algorithm can be written in any
language; we'll write Ruby methods that *implement* DFS and BFS
shortly. What's the difference between an algorithm and a method? An
algorithm is the idea, a process that solves a problem and could be
written in any language. A method is the *implementation*, the actual
realization of the algorithm in Ruby code that can be run.

## Exercises

Estimated time: 8hrs

### Implement a TreeNode class

Write a class named `TreeNode` which represents a node in a binary
tree. It should have the following interface:

* A `#parent` method to get the node's parent (if any)
* Setters and getters for the `left` and `right` child nodes
  * this should set the assigned `TreeNode`'s `parent`
  * it should also set the old child's (if any) `parent` to `nil`
* Setter and getters for the node's `value`

* Write a method `dfs` which takes a value to search for and performs
  the search.
  * Write this recursively
    * first check the value at this node
    * next recursively check left node
    * next recursively check the right node
  * If a node's value matches the target value, return the node.

* Write a method `bfs` to implement breadth first search
  * You will use a local `Array` variable to implement this
  * First insert the current node (`self`) into the array
  * Then, in a loop that lasts while the array is not empty
    * remove the first node
    * check its value
    * push the node's children to the end of the array
  * Prove to yourself that this will check the nodes in the right
    order

* Improve your `TreeNode` to handle an arbitrary number of children
* Improve your searches to optionally take a block that will return
  true when an acceptable value is found.

### Knight's Travails

Write a method, `knight_path(start, end)`, that finds a path for a
knight between two positions on a chess board.

You can represent sequences of knight moves with a tree. Each
parent-child connection represents one move. The root is the knight's
starting position.

So if the knight starts in the middle of the board (e.g., e4), the
root node has eight children representing the eight possible moves and
new knight moves.

First, write a helper method, `move_tree`, that will build the move
tree. Note that there may be many ways to get to the same position;
make sure to include only one of these paths. To do this, as you grow
the tree, you'll need to keep track of positions you've already found
a path to. Note that if you don't do this, you might get caught in a
loop (you might otherwise move back and forth between two positions
infinitely).

Of the many paths to a position, include only the shortest path (there
may be many shortest paths; pick one). How will you make sure you
never add a suboptimal path?

In `knight_path`, build the tree, then perform a search for the target
position. Assuming the target is reachable, use the `parent` chain to
construct the series of moves.

### Tic-tac-toe AI

Extend your tic-tac-toe AI player so that is is unbeatable.

You can imagine representing the possibilities of the game in a
tree. Each node has a value representing a grid. There would be one
child node for each possible move. For convenience, we may want to
also store who moves next in the `TreeNode`'s `value` (maybe we could
use a hash `{:grid => grid, :next_move => :x}`).

The leaves of the tree are the winning, losing, and drawing grids.

Let us define a *winning grid* for a player:

* the grid is a complete game where the player has won
* it is a grid that, no matter the opponent's move, the resulting
  position is a winning grid

A winning move is one which leads to a winning grid. A losing move is
one which allows the opponent to reply with a winning move.

You should write your AI so that it

1. makes a winning move if possible
2. avoids any losing moves
3. otherwise moves randomly

The crux of your task is in implementing a `is_winning_node?(node,
player)`. Intuitively, this should check that every child (grid after
opponent's move) has a child (grid after our next move) which
`is_a_winning node?`.

`is_losing_node?` should then be easy to define; none of the child
nodes should be a winning node for the opponent.

Final note: since the kind of search we're doing to evaluate
`is_winning_node?` is a little sophisticated, it doesn't fit under DFS
or BFS. That's okay; you'll have to figure out the proper recursion.

## References

* Wikipedia: [Data structure](http://en.wikipedia.org/wiki/Data_structure)
* Wikipedia: [Algorithm](http://en.wikipedia.org/wiki/Algorithm)

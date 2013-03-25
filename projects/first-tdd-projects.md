# Test Driven Development

* Re-do w1d1 Array exercises TDD.
    * That means writing specs alongside code.
    * For Towers of Hanoi, focus on non-UI stuff first.
        * `#render`
        * `#move`
        * `#won?`
* TreeNode TDD
    * Implement `bfs` and `dfs`.
    * Test that nodes are visited in the right order.
        * You can do this by checking that the various nodes in the tree
          receive `#value` in the specified order.
        * You will want to check out the [`#ordered` expectation][rspec-doc].
* [SalesEngine][sales-engine]

[rspec-doc]: https://www.relishapp.com/rspec/rspec-mocks/docs/message-expectations
[sales-engine]: http://tutorials.jumpstartlab.com/projects/sales_engine.html

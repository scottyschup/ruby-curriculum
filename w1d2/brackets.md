# The Mysterious Brackets Methods

You've probably seen something like the following by now:

```ruby
class Board
  attr_accessor :grid

  def initialize
    @grid = [[1, 2, 3], [4, 5, 6]]
  end

  def [](pos)
    # We expect position to be an array here.
    @grid[pos.first][pos.last]
  end

  def []=(pos, value)
    @grid[pos.first][pos.last] = value
  end
end
```

How do these work?

## They are regular instance methods.

```ruby
board = Board.new
# => #<Board:0x007fd781d15690 @grid=[[1, 2, 3], [4, 5, 6]]>
board.[]([0, 0])
# => 1

board.[]=([0, 0], "New Value!")
# => "New Value!"
board
# => #<Board:0x007fd781d15690 @grid=[["New Value!", 2, 3], [4, 5, 6]]>
```

I called them with the usual method syntax and fed them arguments in parantheses, i.e. `object.method(arguments)`.

## Ruby gives us some syntactic sugar.

Ruby will let us give the first argument to the methods `Board#[]` and `Board#[]=` _inside_ the square brackets.

```ruby
board = Board.new
# => #<Board:0x007fd782a93c18 @grid=[[1, 2, 3], [4, 5, 6]]>
board[[0, 0]]
# => 1
board[[0, 0]] = "New value!"
# => "New value!"
board
# => #<Board:0x007fd782a93c18 @grid=[["New value!", 2, 3], [4, 5, 6]]>
```

That's it!

## What are they for?

If you're passing around a `Board` object, it's annoying to access elements in that board's grid like this: `board.grid[0][1]`. These methods let us access like this: `board[[0,1]]`.
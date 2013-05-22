# Ruby Library Management

Many of our projects have been contained in a single file, but
in real projects, programs are spread out across many files and
folders.

Ruby gives us three means by which to manage dependencies among
those files:

  * `require`
  * `require_relative`
  * `load`

## Why?

*lib/board.rb*

```
class Board
  def initialize
    @grid = Array.new(10)
  end
end
```

*lib/game.rb*

```
class Game
  def initialize
    @board = Board.new
  end
end

game = Game.new
```

*in terminal*

```
$ ruby lib/game.rb
lib/game.rb:3:in `initialize': uninitialized constant Game::Board (NameError)
```

Ruby doesn't know what `Board` is (because it's defined in another
file) and so throws an error.

Well, we know how to deal with this:

*lib/game.rb*

```
require 'board'

class Game
  def initialize
    @board = Board.new
  end
end

game = Game.new
```

A simple `require 'board'` statement at the top of *game.rb* should do
the trick.

*in terminal*

```
$ ruby lib/game.rb
.../lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:36:in `require':
cannot load such file -- board (LoadError)
```

?!!? What in the world? A `LoadError`?

A `LoadError` is basically telling you that Ruby did not find the file
that you told it to load.

But `board.rb` is in the same directory. Shouldn't that be enough?

Unfortunately, no. Why not? Because of Ruby's load path.

## Ruby's Load Path `$:`

Whenever you use a `require` statement, Ruby tries to find the
specified file in its load path, which is a list of directories. Its
specific purpose is to maintain the list of directories through which
Ruby will search when a `require` or `load` statement is run by the
interpreter.

The load path includes things like the files that make up Ruby's
Standard Library as well as gems you have installed. You can always
access it through the global variable `$:`.

The directory `'.'` (i.e. the current directory) is not in the load
path. Funny enough, it used to be, but in Ruby 1.9.2, the
current directory was removed from the load path for security
reasons. Oh well.

So, what can we do?

We have two options:

1. Use `require_relative`
2. Add a folder to the load path with the `-I` flag

## `require_relative`

`require_relative` is `require`'s sometimes more helpful brother.
It does just what `require` does, but instead of looking up a file
in the load path, it will use the current directory as its starting
point.

*lib/game.rb*

```
require_relative `board`

class Game
  def initialize
    @board = Board.new
  end
end

game = Game.new
```

*in terminal*

```
$ ruby lib/game.rb
$
```

Ah, wonderful. Everything worked without a hitch.

## Add a folder to the load path `-I`

Another option we have it to add the current directory to the load
path using the `-I` flag when we call the `ruby` or `irb` or `pry`
commands in the terminal.

*lib/game.rb*

```
require `board`

class Game
  def initialize
    @board = Board.new
  end
end

game = Game.new
```

*NB: Note the regular `require` statement.*

*in terminal*

```
$ ruby -I lib lib/game.rb
$
```

Once again, everything goes off without a hitch.

What happened here?

The `-I` flag takes a single directory as an argument and
adds it to the load path. Here, I added `lib` to the load
path and so when the `require 'board'` statement was hit at the
top of the game file, the interpreter had no problem finding it.

The convention with the `-I` flag is actually to leave no space
between the flag and the folder and so you may see the flag used
like so (and you should use it this way too):

```
$ ruby -Ilib lib/game.rb
$ ruby -I. my_file.rb  # Adds the current dir to the path
$ pry -Ispec spec/file_spec.rb
```

## `load`

Finally we come to `load`.

What's the difference between `load` and `require`?

With `require`, Ruby keeps a list of the files that have already
been required, and so if you require a file twice (for example,
in pry or irb), the second call to `require` will do nothing.
The Ruby interpreter will check to see if that file has previously
been required, see that it has, and do nothing.

`load` will read in the file every time no matter what. This can
be useful especially when working with a file in pry or irb.
You interact with it in pry, then go and change something in the
file. If you use `require` in pry each time, you won't actually
see the changes in your file reflected in pry because the
interpreter sees that the file has previously been required and
does nothing. But if you use `load`, the updated file will be read
in.

*NB: `require_relative`, as was mentioned before, works in exactly
the same way as `require`.*

---

**Misc.**

Note that local variables defined at the bottom of files, regardless
of whether they're read in using `require` or `load` will not be
available in pry or irb.
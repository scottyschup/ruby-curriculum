# Keyboard Shortcuts

Developers prefer keyboard shortcuts to using the mouse; using the
mouse can slow you down significantly. Try to use the keyboard as much
as possible. Here's some good shortcuts to try:

## Textmate

### Navigation

* Go to file: `Cmd + t`
* Close tab: `Cmd + w`
* Next tab: `Opt + Cmd + LArrow`
* Previous tab: `Opt + Cmd + RArrow`
* Go to line: `Cmd + l`
* Show project drawer: `Ctl + Opt + Cmd + d`
  * Note: A project is a folder which contains multiple related files.
    These shortcuts will be very useful when we get to Rails.
* New tab: `Opt + Cmd + n`

### Finding

* Find: `Cmd + f`
* Find anywhere in project: `Shift + Cmd + f`

### Editing

* Comment out selection: `Cmd + /`
* Indent selection: `Cmd + ]`
* Unindent selection: `Cmd + [`
* Select line: `Shift + Cmd + l`
* Delete current line: `Shift + Ctl + k`
* Duplicate current line: `Shift + Ctl + d`
* Undo: `Cmd + z`

Check out the [TextMate Manual][tm_man], which is great! This
[essential TextMate shortcuts tutorial][tm_tut] might be easier to
follow. And maybe try this quick pdf reference for
[TextMate shortcuts][tm_cheatsheet].

Lastly, in case you don't know or forget what a ⌥ key is,
[key reference][key_reference].

[tm_tut]: http://net.tutsplus.com/tutorials/tools-and-tips/essential-textmate-shortcuts-tips-and-techniques/
[tm_man]: http://manual.macromates.com/en/all_pages.html
[tm_cheatsheet]: https://sites.google.com/a/grayskies.net/www/textmate
[key_reference]: http://myfirstmac.com/images/uploads/articleImages/key-symbols.gif

## Bash

When you open your terminal, bash is the program that reads your
commands to execute other programs. Fluency with bash is important.

Here are some core line-editing keyboard shortcuts:

```
         beg-of-line: ctr-a
         end-of-line: ctr-e
   move-to-prev-word: option-left
   move-to-next-word: option-right
  kill previous word: option-backspace
         kill-to-end: ctr-k
         kill-to-beg: ctr-u
```

If you are setting up Terminal.app on your own machine, you will have
to go into `Terminal > Preferences Keyboard` and check `Use option as
meta key`.

You can also scroll back in the history intelligently using up and
down. Normally, up and down just scroll through previous commands. But
if you copy my [.inputrc][inputrc], you'll be able to scroll through
only commands which start with the prefix you type.

On any of the school machines, type `git ` into the terminal. If you
hit up and down now, you'll only scroll through previous git
commands. This is often a lot more useful for scrolling back to
commands from long ago.

That's what my [.inputrc][inputrc] enables. This is installed on our
machines. For yours, download the file (click "raw") and save it to
`~/.inputrc`. The `.` prefix means it is a hidden file; this is
important.

[inputrc]: https://github.com/ruggeri/dotfiles/blob/master/inputrc

If you're on a mac laptop, it may be nice to switch `caps-lock` with
`ctrl` key (System Preferences > Keyboard > Modifier Keys). You can do
that in your keyboard preferences. Makes hitting things like `ctrl-a`
and `ctrl-e` a little bit easier. Who uses caps-lock anyway?

# Aliases are your friend

## What's an alias?

An alias is a shell command that enables the replacement of a word with another
string. Aliases are not a git-specific tool, but git is a great use case. For
example, instead of

```bash
git commit -m 'add password length validation'
```

you can type

```bash
gcm 'add password length validation'
```

If you're doing git right, you're making a lot of commits, so even a small
optimization like this quickly becomes worthwhile. Aliasing your most commonly
usesd git commands can make the difference between you lazily neglecting to make
commits vs. committing frequently.

## Creating an alias

To create a persistent alias, you add a line to your shell's configuration file.
The specific name of this file can vary between systems. On my Mac,
`~/.bash_profile` does the job; on other systems, you might want `~/.bashrc`.
Open your config file (ex. `atom ~/.bash_profile`) and add your desired alias on
a new line at the end of file, formatted like so:

```bash
alias gcm='git commit -m'
```

Save the config file and **open a new terminal tab**. You can now use your
alias.

## Adding aliases

Whenever I find myself typing a command repeatedly, I create an alias for it. In
this way, over time, you can build up your own custom set of aliases. Here's
what [my ~./bash_profile][bash-profile] looks like.

I add shell aliases frequently enough that, somewhat recursively, I added an
alias to open my shell configuration file, so that I can easily add a new alias:
`alias bp='atom ~/.bash_profile'`.

[bash-profile]: ./bash_profile

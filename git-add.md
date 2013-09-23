# Using Git add

<b>TL;DR: Use `git add -A` instead of `git add .` or `git add -u`.</b>

## The background.

So you've been working on a small project, and you've been committing all your files at once each time... At some point, you realize that there's a file that you don't need anymore, so you delete it and write some more code.  

Eventually you run `git add .`, commit it, push it to github, and forget about it for a couple of weeks.

Two weeks later, you pull your repo from github.  You try testing out the code, but everything fails!  There are old classes and methods from the file you deleted climbin' in your windows, snatchin' your methods up, and cluttering up your code!

What happened?

When you run `git add .`  you're telling git, "take everything in my current directory and add it to the staging area".  This does NOT remove the files that you deleted from the repo--it only adds files.As a result, those files reappear when you pull down the repo again.

What should I do instead?

1. Ideally, you should be adding individual files as you create them, and running `git add -u filename` to update/delete them.  Do NOT just run `git add -u` because you won't be adding any new files; you're only updating files that git is already tracking.
2. If you really want to add all your files, use <b>`git add -A`</b>.  This is like a combination of `git add -u` and `git add .`; it will update/delete tracked files AND add new ones.

NOTE: -A and -u are options of the `git add` command.  Git add default

## The visuals

<table>
	<tr style="border-bottom: 1px, black;">
		<td>Git add .</td><td>Git add -A</td><td>Git add -u</td>
	</tr>
</table>


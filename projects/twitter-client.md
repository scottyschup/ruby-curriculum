# Twitter Client

**TODO: Facebook project as well?**

We'll use the [Twitter API][api-docs] to build a command line Twitter
API.

* Post a status
* Get your timeline
* Get statuses for users
* Direct message other users

Hint: you will eventually need to set your app to ask to both read and
post on your users' behalf. This is a key benefit of OAuth: a
gradation of permission levels.

You will want to use the [OAuth gem][oauth-github]. Look at my example
at the end of the [OAuth chapter][oauth-chapter].

## General architecture

You should make your program Object-oriented.

* Write a `Status` (Twitter's technical name for a tweet) class; a
  `Status` belongs to a `User`; you should be able to get the user by
  writing `status.user`.
* Write a `User` class. You should be able to get the statuses by
  writing `user.statuses`.
* You should be able to DM another user via `user.dm(message)`.
* You should be able to get your timeline via a class method
  `User.timeline`.
* Extend your `Status` class to add methods like `mentions` to extract
  mentioned users, or `hashtags` to return a `Hashtag` object.
* You should be able to write `hashtag.statuses` to pull up statuses
  for a hashtag.

## Extra Credit
Persist your Users and Tweets by saving the objects to a file. Load
from said file everytime you run your script.

[api-docs]: https://dev.twitter.com/docs/api/1.1
[oauth-github]: https://github.com/oauth/oauth-ruby
[oauth-chapter]: ../the-web/oauth.md

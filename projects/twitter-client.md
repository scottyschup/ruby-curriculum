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

You will want to use the [OAuth gem][oauth-github].

## General architecture

You want to make your twitter client as general purpose as possible.
With that in mind, think about creating a User class, a Tweet class,
etc. Think about how a Tweet object would relate to a User (for
example, how a User would fetch all their related Tweet objects?)

Extra Credit:
Persist your Users and Tweets by saving the objects to a File. Load
from said file everything you run your script.

[api-docs]: https://dev.twitter.com/docs/api/1.1
[oauth-github]: https://github.com/oauth/oauth-ruby

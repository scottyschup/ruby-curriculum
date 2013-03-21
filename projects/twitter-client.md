# Twitter Client

We'll use the [Twitter API][api-docs] to build a command line Twitter
API. Some things we want to be able to do:

* Post a status.
* Get your timeline.
* Get statuses for users.
* Direct message other users.

You will want to use the [OAuth gem][oauth-github]. Look at my example
at the end of the [OAuth chapter][oauth-chapter]. Using OAuth will let
your application act on behalf of a user.

## General architecture

You should make your program Object-oriented:

### `Status`

* Write a `Status` (Twitter's technical name for a tweet) class; a
  `Status` belongs to a `User`; you should be able to get the user by
  writing `status.user`.
* To start, the instance variables you should store are the status
  message and the user who tweeted it.

### `User`

* Write a `User` class. You should be able to get the statuses by
  writing `user.statuses`.
* To start, the only instance variable your `User` will need is a
  username.

### `EndUser`

#### Class methods

* You should write a class `EndUser` which subclasses `User`.
* `EndUser` should have a class method,
  `EndUser::login(username)`, which uses Launchy to prompt the
  user to authorize the service.
* `EndUser::login` should store a class instance variable,
  `@@access_token`, after login. Other classes should be able to
  access this through a getter method `EndUser::access_token`.
    * For instance, inside `User#statuses` we will need to use
      `EndUser::access_token` to make the API call.
* Most classes will probably want to use `EndUser::access_token`
  to communicate with the Twitter API.
* Until the `EndUser` calls `login`, `EndUser::access_token` will
  return `nil`, of course.
* `EndUser` should also have a class method
  `EndUser::current_user` which returns an `EndUser` instance with
  your name.
    * You probably want to create a new `EndUser` and store it in a
      `@@current_user` class variable after you `login`.

#### Instance methods

* `EndUser` should have an instance method, `timeline`, which gets
  your timeline.
* `EndUser` should also have instance methods `dm(target_user,
  message)` and `tweet(message)`.

## Extra Credit

* Extend your `Status` class to add methods like `mentions` to extract
  mentioned users, or `hashtags` to return a `Hashtag` object.
* You should be able to write `hashtag.statuses` to pull up statuses
  for a hashtag.

Persist your Users and Tweets by saving the objects to a file. Load
from said file everytime you run your script.

[api-docs]: https://dev.twitter.com/docs/api/1.1
[oauth-github]: https://github.com/oauth/oauth-ruby
[oauth-chapter]: ../the-web/oauth.md

# OAuth

## The problem
We've already seen how a client can authenticate with a server so that
subsequent requests may be checked for authorization. In the scheme
we've discussed, the user give his username and password to the
application, which then logs in as the user and performs actions in
his name.

Consider a application like Instagram which integrates with
Facebook. One way to give Instagram the power to post photos to your
wall would be to provide Instagram with your facebook username and
password.

The average user may not be too keen on giving their password to any
site that integrates with Facebook. But there are other problems: how
do we limit Instagram to posting on the wall, and not messaging our
friends, too? How could we revoke Instagram's access to our Facebook
account short of changing our password?

OAuth (and OAuth 2.0) is the authentication scheme that solves way
these problems are solved.

## A solution: OAuth

OAuth is a solution which avoids having the user give his password to
the client application. Here's roughly how it works:

1. The client application writer registers with the service provider;
   part of the registration involves selecting what permissions should
   be granted. For instance, Instagram registers with Twitter,
   specifying that Instagram should be authorized to post to a user's
   wall. The client receives some *keys*, or codes, from the service
   provider.
2. When a user wants to grant permission to the client application,
   the application directs them to a special URL hosted by the
   service. This page displays the application name and what
   permissions will be granted. The user will have to be logged in to
   the service, and can then clicks to authorize. For example,
   Instagram redirects the user to a twitter.com page which asks
   whether the user would like to authorize Instagram to post status
   updates.
3. If the user accepts, the service will redirect the user back to a
   page hosted by the client application. The URL the user is
   redirected to includes an embedded authorization key (typically as
   part of the URL query string). The client application extracts the
   key and stores it in a database.
4. All subsequent requests by the client application include the
   token; the service checks that the token is valid and that the user
   has authorized the application to make this request.

A few important points:

1. Because the user only inputs his password on a service webpage, the
   client application never receives the user password.
2. Because the client must configure the requested permissions at
   registration, the user knows exactly what permissions the client
   application will receive.
3. The key issued to the client may be revoked by the user (or
   service) at any time. This can be done without affecting any other
   clients the user may have authorized.

We've given a very high-level overview, but the general structure of
OAuth should make sense to you. Probably the most popular OAuth
authenticated API is the Twitter API. There is a successor standard,
OAuth 2.0, which is used by Facebook. The underlying details differ
somewhat, but this overview applies equally to both, and we won't have
to worry about the minor differences.

## OAuth in action

Luckily, most of the details of OAuth are taken care of by the oauth
gem. Let's write a small program to fetch your timeline from Twitter.

First, we'll need to register our app with Twitter. Head to
https://dev.twitter.com/apps/new (you will need to be logged
in). Choose a name and description. For website, put a placeholder
like appacademy.io; this is only used to show the user a link
describing your application.

Normally we would specify a *callback URL*, which is where the user
will be redirected after authorization; the application web server
would receive this request, which would embed a key for the
application to use to make requests on behalf of the user.

We're not going to create a web app, so there is no webserver to
receive the key this way. Instead, by leaving this field blank the
user will be given a numeric code which he can in turn type into the
application. The application will use this number to request a key
from Twitter. This is somewhat inconvenient for the user, but will
serve our own purposes fine.

We are ready to go! In particular, our app settings page will give us
a pair of consumer keys and secrets. These will be used by our
application to prove its identity. Let's begin setting up our app.

```ruby
require 'oauth'

# "consumer" in OAuth terminology means "client" in our discussion.
CONSUMER_KEY = "consumer_key_from_service"
CONSUMER_SECRET = "consumer_secret_from_service"

CONSUMER = OAuth::Consumer.new(
  CONSUMER_KEY, CONSUMER_SECRET, :site => "http://twitter.com")

# ask the user to authorize the application
def get_access_token
  # send user to twitter URL to authorize application
  request_token = CONSUMER.get_request_token
  puts "Go to this URL: #{request_token.authorize_url}"

  # because we don't use a redirect URL; user will receive an "out of
  # band" verification code that the application may exchange for a
  # key; ask user to give it to us
  puts "Login, and type your verification code in"
  oauth_verifier = gets.chomp

  # ask the oauth library to give us an access token, which will allow
  # us to make requests on behalf of this user
  access_token = request_token.get_access_token(
      :oauth_verifier => oauth_verifier )
end

# fetch a user's timeline
def user_timeline(access_token)
  # the access token class has methods `get` and `post` to make
  # requests in the same way as RestClient, except that these will be
  # authorized.
  access_token.get("http://api.twitter.com/1.1/statuses/user_timeline.json").body
end
```

## Resources

* OAuth gem on [github][oauth-ruby-github]

[oauth-ruby-github]: https://github.com/oauth/oauth-ruby

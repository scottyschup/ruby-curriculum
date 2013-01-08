# HTTP
## Goals

* What is a protocol? What is HTTP used for?
* What are the parts of an HTTP request?
  * The method?
    * What are the basic methods?
    * What is method safety?
  * The URL?
    * What are the scheme, host, path, and query string?
  * The body?
* What is a header?
* What is the status code used to communicate?
  * What is the success status code?
  * What is a missing resource status code?

## What is HTTP?
HTTP is the *HyperText Transfer Protocol*. Whenever you visit a
webpage, your browser first issues an HTTP *request* for the page to
the server, which then issues a *response* back to your computer
containing the HTML and content.

A *protocol* is a system of digital message formats and rules for
exchanging those messages. In particular, a protocol specifies the
formats of the messages the *client* (usually your web browser) and
*server* (a web server hosting the page) exchange. A protocol defines
the structure of these exchanges.

Let's see an HTTP request get made, and its response. This request is
made from the command line:

![http request cycle](http://upload.wikimedia.org/wikipedia/commons/c/c6/Http_request_telnet_ubuntu.png)

The part in red is the request; the user specifies a *method* (`GET`),
the *resource* (or, in layman's terms, the "page": /wiki/Main_Page),
the protocol version (http/1.1) and the *host*
(en.wikipedia.org). This request will be routed through the internet
to the host (a server for en.wikipedia.org), which will then fetch the
resource (a GET request fetches a resource), and then send it back to
the requester.

The response from the server is in blue and in green. The green part
is the *body*, or meat of the response. This is the content that was
requested. Here, it's an HTML web page.

The blue part consists of the *headers*; the headers are not part of
the content proper, but they contain valuable information for the
requester. The most important one is the *status code* which tells the
client whether the request was successful. The status code is in the
first line of the headers: "HTTP/1.1 200 OK". 200 is the "OK" status
code; everything worked fine. Other common status codes are for a
missing resource (404 Not Found), a redirection to another resource
(301 Moved Permanently), and an unauthorized request (403 Forbidden).

There are generally many other headers returned, and though they are
sometimes important, usually they are inconsequential for our
purposes.

Let's move on to discuss the protocol methods in a little more detail.

## HTTP methods (verbs)
Each HTTP request that is made asks the server to do something. By far
the most common request is a "GET", which asks the server to fetch a
resource and return it. "POST" is another common request; a POST
request asks the server to accept some uploaded data, and store
it. When you submit a form, you often POST the contents of the form to
the server.

There is also a PUT request, which differs slightly from POST; POST is
used to create new resources (like create a new customer in the
database), while PUT is used to update an existing resource (like
update a customer's address). Like POST, PUT uploads data to the
server.

Finally, there is the DELETE method; this is used to delete an
existing resource; for instance, perhaps we lose a client, and want to
delete the customer from our database.

### Method safety
As we've mentioned, some of these HTTP methods are used to ask a
server to create, modify, or delete data stored in the server's
database. By convention, a `GET` request *should not* result in the
server modifying any data. Writers of web applications *should* ensure
that a `GET` request won't do this, intentionally or otherwise.

A `GET` request is supposed to be "safe"; no harm should be done just
by asking for a representation of a resource. Web crawlers like
googlebot rely on this, because googlebot will follow links (that
result in `GET` requests) but will not make `POST`, `PUT`, or `DELETE`
requests.

In older days, inexperienced devs would not always respect this
convention. For instance, they might create a link to
"posts/1234?delete"; a `GET` request for this resource would delete
the post. But then googlebot came along, crawled all the links on the
page, and deleted all the posts. At the time, Google got a lot of
complaints about this kind of thing.

The solution was to only delete posts when `DELETE` is requested
against "posts/1234"; googlebot will never do
this. This solution removes the "?delete" part of the URL, so that the
method action is expressed the by the HTTP verb and not duplicated
within the URL.

Of course, why did they let an unauthenticated user delete posts? :-)

## HTTP and application servers

HTTP requests are processed by web application servers, which are
computer programs that are responsible for generating the
response. The application can respond to the request by doing anything
it wants. It is up to the application to decide that when I make a
`GET` request for `/posts/1234` this means that I want to receive the
HTML for a web page including the content for post #1234.

That would be a reasonable response. But just like we saw with the
delete links, I could respond to this request by deleting a post from
the database, returning a random entry, or just about anything.

The point here is that HTTP is a way to communicate requests and
responses. The methods of HTTP define what the user is requesting of
the server. But it is ultimately the application code on the server
which determines how the requests are processed. In particular: HTTP
doesn't define how the request gets processed, that's will be our job
as web developers.

## Request body and query string
When we make a POST or PUT request, we can upload content to the
server by embedding it in the request's body. An example that might
create a new Judge entry for Joe Brown, a TV judge:

```
POST /judges HTTP/1.1
Host:law.com
Content-type:application/x-http-form-urlencoded

name=Joe+Brown&court=television+court
```

Here the request content is `name=Joe+Brown&court=television+court`,
which is in a format called URL encoding. We specify the content-type
in a request header so that the server knows how to decode the
payload. URL encoding is also often used for request bodies, but other
formats like JSON are supported.

GET requests don't have a body. How can a GET request send data to the
server? For instance, to perform a search, we might make a GET request
to www.bing.com for the `/search` resource. This asks the server to
perform a search, but for what?

We embed our query in the *query string*. The query string is an
optional part of the resource, separated from the rest by a question
mark. For example, in the url

    www.bing.com/search?q=where+in+the+world+is+carmen+sandiego

The resource is "/search", the query string is
"q=where+in+the+world+is+carmen+sandiego". When the Bing server
receives the GET request it will also have access to the query string
embedded in the path. This query string is an URL encoded version of
the hash

```ruby
{ :q => "where in the world is carmen sandiego" }
````

The Bing server will use the query string parameters to build its
response to the GET request: presumably, it will treat the value keyed
by "q" as the *query*. Once the server has generated the search
results and the HTML response, it sends this back to the requester.

## Exercises
Estimated time: .25hrs

### Netcat

`nc` ("netcat") is the simplest, lowest-level program for
communicating with a server. You give `nc` a hostname and port (`nc
www.google.com 80`) and it opens a connection to that server. You can
then type an HTTP request to the server. Use `nc` to make a GET
request for the Google homepage. Follow the example given in the image
above (you may need to change the 'http' to uppercase).

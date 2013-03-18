Hi Matt!,

Good question. The Ruby `||` operation does something called short circuiting:

    true || this_code_is_not_run
    false || this_code_will_be_run

Ruby is sort of lazy; it won't evaluate the right side if the left
side of `||` is already true. That makes sense, because regardless of
what the right side is, the whole or statement will always be true.

Ruby will return the first "truthy" value from the or:

    (1 || 2) == 1
    (nil || 5) == 5

So:

    node[ch] ||= Hash.new

Is the same as

    node[ch] = node[ch] || Hash.new

Which says that if `node[ch]` isn't set (is `nil`), set it to
`Hash.new`.

Hope this helps!

On Sat, Mar 16, 2013 at 1:42 PM, Matthew Shopsin <mshopsin@gmail.com> wrote:
> In QA you gave a spelling tree example.  On wikipidiea they have a slightly
> more specialized data structure with called a trie with a Ruby example
> (http://en.wikipedia.org/wiki/Trie)
>
> There was one line that I didn't understand
>
> node[ch] ||= Hash.new
>
>
> What does the ||= operator do?
>
> --
> -Matthew Shopsin


# DRY (Don't Repeat Yourself)

In *The Pragmatic Programmer*, Hunt and Thomas define the DRY
principle as follows:

> Every piece of knowledge must have a single, unambiguous,
> authoritative representation within a system.

In other words: don't repeat yourself!

The most common way to avoid repetition is to break duplicated code
into methods.

```ruby
def process_consumer_address_form(fields)
  unless fields[:zip] =~ /[1-9][0-9]{4}/
    raise InvalidZipCodeError
  end

  # more form processing
end

def process_business_address_form(fields)
  unless fields[:zip] =~ /[1-9][0-9]{4}/
    raise InvalidZipCodeError
  end

  # more form processing
end
```

See how we've repeated the bit that checks that the zipcode is valid?
This is bad; if there was a bug with our zipcode validation, we'd have
to fix the code **in two places**. This is a pain, and we'll probably
forget to fix the duplicated code everywhere, so it's also a source of
bugs. For this reason, we want to find a way to eliminate the
duplicated code:

```ruby
def process_consumer_address_form(fields)
  raise InvalidZipCodeError unless valid_zip?(fields[:zip])
  # more form processing
end

def process_business_address_form(fields)
  raise InvalidZipCodeError unless valid_zip?(fields[:zip])
  # more form processing
end

def valid_zip(zip)
  zip =~ /[1-9][0-9]{4}/
end
```

Breaking the duplicated code into a method has the side-effect of
making the consumer/business methods shorter and more focused on the
details of checking the form, rather than the details of zipcode
validation.

## Flay

[Flay](https://github.com/seattlerb/flay) examines your codebase
looking for structural similarities in code sections. It doesn't catch
all refactorings you should make, but it has few false-positives. Try
running it on code you write going forward.

## Watching a variable

Need to keep an eye on a variable's value? Try `display your_variable_name_here`.

```ruby
# display.rb
second_num = nil
third_num = nil

(1..100).each do |first_num|
  debugger
  second_num = first_num ** 3
  third_num = second_num - first_num if first_num.even?
end

```

```
david ~/Dropbox/TA $
ruby -r byebug display.rb

[1, 8] in display.rb
   1: second_num = nil
   2: third_num = nil
   3:
   4: (1..100).each do |first_num|
   5:   debugger
=> 6:   second_num = first_num ** 3
   7:   third_num = second_num - first_num if first_num.even?
   8: end
(byebug) display second_num
1: second_num = nil
(byebug) c
1: second_num = 1

[1, 8] in display.rb
   1: second_num = nil
   2: third_num = nil
   3:
   4: (1..100).each do |first_num|
   5:   debugger
=> 6:   second_num = first_num ** 3
   7:   third_num = second_num - first_num if first_num.even?
   8: end
(byebug) c
1: second_num = 8

[1, 8] in display.rb
   1: second_num = nil
   2: third_num = nil
   3:
   4: (1..100).each do |first_num|
   5:   debugger
=> 6:   second_num = first_num ** 3
   7:   third_num = second_num - first_num if first_num.even?
   8: end
(byebug)
```
You can add additional variables at any time.

```
(byebug) display third_num
2: third_num = 6
(byebug) c
1: second_num = 27
2: third_num = 6

[1, 8] in display.rb
   1: second_num = nil
   2: third_num = nil
   3:
   4: (1..100).each do |first_num|
   5:   debugger
=> 6:   second_num = first_num ** 3
   7:   third_num = second_num - first_num if first_num.even?
   8: end
(byebug)
```

## Looking at the call stack: `where`

Another handy byebug command is `where`.
You have seen stack traces when an error is raised in your program. The `where` command allows you to view the stack trace without having to raise an error. This can be handy.


Suppose that you have a method that is called from different parts of your program.
Usually the method works as expected, but every once in a while your method raises an error or produces an unexpected result.
The method itself might be fine; the problem might have originated elsewhere.
However, you don't want to go to all of the different places in your program where the method is called and put a `debugger`
statement at each one to diagnose the problem, especially if the method calls are spread across different classes and files.

It would be much easier if we could put a single debugger within the method in question,
and then *look back* to see where that method was actually called in the code.
Then, once you know where the problem originated, you can fix it.
With byebug, you can do just this. Using the `where` command.

Consider this program:

```ruby
# building.rb
class Building
  def initialize
    @temperature = 70
  end

  def set_thermostat(temp)
    @temperature = temp
  end
end

house = Building.new

# imagine this is called in one part of your program
house.set_thermostat(50 * 4 - 2 - 100 + -30)

# and here set_thermostat is set within some other distant class
house.set_thermostat(200 * 0.5 - 40 + 30 / 2)

# and who knows where this call to set_thermostat could be coming from
house.set_thermostat(100 / 3 + 80 - -30 + 3)
```

You notice that sometimes the house is getting too hot, but which part of your program is causing this problem?

We can set up a *conditional debugger* (line 7 below) that will be triggered when the thermostat is being set too high. Then we can look back and see who was calling `set_thermostat` with an inappropriately high value.

```
david ~/Dropbox/TA $
ruby -r byebug building.rb # you can require gems with the -r option

[3, 12] in building.rb
    3:     @temperature = 70
    4:   end
    5:
    6:   def set_thermostat(temp)
    7:     debugger if temp > 90
=>  8:     @temperature = temp
    9:   end
   10: end
   11:
   12: house = Building.new
(byebug) where
*** Byebug's stacksize (1) should be 2. This might be a bug in byebug or ruby's debugging API's

--> #0  Building.set_thermostat(temp#Fixnum) at building.rb:8
    #1  <main> at building.rb:21
(byebug)
```
Ah ha! We entered the debugger because we met the condition `temp > 90`. Then `where` shows us the call stack. The top of the call stack shows where we are now (#0).
Moving down, we move through the previous method calls.
In this case, there is just one previous method call, originating at line 21 of `building.rb` (the third call to `set_thermostat`).
How easily we have found the culprit!

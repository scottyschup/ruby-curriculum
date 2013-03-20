# `subject` and `let`

## `subject`

To test a class, you will often want to instantiate an instance of the
object to test it out. In this case, you may want to define a subject
for your tests.

```ruby
describe Robot do
  subject(:robot) { Robot.new }

  describe "#position" do
    # position starts at [0, 0]
    its(:position) { should == [0, 0] }
  end

  describe "move methods" do
    it "moves left" do
      robot.move_left
      robot.position.should == [-1, 0]
    end
  end
end
```

The `subject` method is passed a name for the subject (`:robot`), as
well as a block which constructs the subject. You can do any necessary
setup inside the block.

The `#position` test uses `its`. `its` takes a method, which it then
runs on the `subject`; the block says the returned value should be
`[0, 0]`.

Other tests need to do more than test the initial value. For instance,
the second test test first moves the robot, then tests its
position. You can't use the `its` method for this, but we can refer to
the robot explicitly through the name we gave it.

**Note that `subject` is used outside of an `it` spec**. Neither
`subject` nor `let` can be defined inside of a spec; they are defined
outside specs and used within them.

## `let`

`subject` lets us define the subject of our tests. Sometimes we also
want to create other objects to interact with the subject. To do this,
we use `let`. `let` works just like `subject`, but whereas `subject`
is the focus of the test, `let` defines helper objects. Also, there
can only be one `subject` (if you call it again, the subject is
overriden), whereas you can define many helper objects through `let`.

```ruby
describe Robot do
  subject(:robot) { Robot.new }
  let(:light_item) { double("heavy_item", :weight => 1) }
  let(:max_weight_item) { double("max_weight_item", :weight => 250) }

  describe "#pick_up" do
    it "should not add item past maximum weight of 250" do
      robot.pick_up(max_weight_item)

      expect do
        robot.pick_up(light_item)
      end.to raise_error(ArgumentError)
    end
  end
end
```

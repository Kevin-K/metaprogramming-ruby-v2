class MyClass
    def initialize
        @v = 1
    end
end

obj = MyClass.new
obj.instance_eval do
    self # => #<MyClass: 0x3340dc @v=1>
    @v   # => 1
end

# instance_eval gives block access into the instance's scope
# Context probe
v = 2
obj.instance_eval  { @v = v }
obj.instance_eval  { @v } # => 2
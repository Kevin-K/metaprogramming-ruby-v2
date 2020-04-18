module MyModule
    def my_method
        42
    end
end

unbound = MyModule.instance_method(:my_method)
unbound.class # => UnboundMethod
# you can't call unbound methods, but can use them to generate callable methods
# (using bind or define_method)
String.send(:define_method, :another_method, unbound)
"abc".another_method # => 42
# unbound methods from classes can only bind to objs of same  class/subclass
# unbound methods from modules have no such limitation
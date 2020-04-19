class MyClass
    def my_method
        @x = 1
        binding
    end
end

b = MyClass.new.my_method

eval "@x", b # => 1
eval "self", TOPLEVEL_BINDING # => main
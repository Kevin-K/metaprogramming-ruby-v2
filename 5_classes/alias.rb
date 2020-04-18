class MyClass
    def my_method
        'my_method()'
    end
    alias_method :m , :my_method
end

obj = MyClass.new
puts obj.my_method # => "my_method()"
puts obj.m # => "my_method()"
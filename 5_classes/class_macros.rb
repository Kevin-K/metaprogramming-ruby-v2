class MyClass
    def my_attribute=(attr)
        @my_attribute = attr
    end
    def my_attribute
        @my_attribute
    end
end

obj = MyClass.new
obj.my_attribute = 1
obj.my_attribute # => 1



class MyOtherClass
    attr_accessor :my_attribute
end

obj2 = MyOtherClass.new
obj2.my_attribute = 1
obj2.my_attribute # => 1


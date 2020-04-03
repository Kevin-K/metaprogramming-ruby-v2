class MyClass
    def my_method(my_arg)
        my_arg * 2
    end
end

obj = MyClass.new

# standard dot notation
obj.my_method(3)

#using send
obj.send(:my_method, 3)

# ^ Dynamic dispatch, wait until last oportunity to determine
# method to call while code is running.
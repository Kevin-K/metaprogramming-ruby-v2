class MyClass
    def testing_self
        @var = 10   # instance variable of self
        my_method() # same as self.my_method()
        self
    end
    def my_method
        @var = @var + 1
    end
end

obj = MyClass.new
obj.testing_self    # obj becomes self => #<MyClass:0x00007fc99c9347d0 @var=11>

self # => main

# private, governed by: can't be called by explicit receiver
# only implicit, thus only self
class C
    def public_method
        self.private_method # this fails by explicit receiver (even though
                            # same instance)
        private_method      # this is allowed (implicit receiver)
    end

    private
    def private_method
    end
end

C.new.public_method

# Big difference from Java:
# Inherited private methods are callable in ruby
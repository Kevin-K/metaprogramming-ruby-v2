# Class instance variables are members of the class
# not the instantiated object
class MyClass
    @my_var = 1
    def self.read
        @my_var
    end
    def write
        @my_var = 2
    end
    def read
        @my_var
    end
end

obj = MyClass.new
ob.read # => nil
obj.write
obj.read # => 2
MyClass.read # => 1
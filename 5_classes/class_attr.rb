# define a attribute on the CLASS not on the object
class MyClass
    class << self
        attr_accessor :a
    end
end

MyClass.a = 2
MyClass.a # => 2

obj = MyClass.new
obj.respond_to?(:a) # => false
class MyClass
    def my_method
        @v = 1
    end
end

obj = MyClass.new
obj.class # => MyClass

# Insance Variables:
# don't exist until first assignment
obj.instance_variables # => []
obj.my_method # => 1
obj.instance_variables # => [:@v]

# (Instance) Methods:
# inherit from base (Object)
obj.methods # => [:my_method, ...<Object instance methods>]

# are not stored in the memory of the object (obj has a class reference and instance variables)
# the class holds method definitions (Like other OO languages)
obj # => #<MyClass:0x00007f9fed833c38 @v=1>


# Classes are objects
"hello".class # => String
String.class #=> Class
Class.class #=> Class
Class.methods #=> [...<Class methods avail to all classes ex: attr_accessor>]
Class.instance_methods(false) #=> [:allocate, :superclass, :new]
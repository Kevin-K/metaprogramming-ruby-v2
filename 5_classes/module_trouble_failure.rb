module MyModule
   def self.my_method
    'hello'
    end
end

class MyClass
    include MyModule
end

puts MyClass.respond_to?(:my_method) # => false

# The problem, module defined method with self
# Placing it on it's singleton class
# Which when MyClass includes MyModule, MyClass method calls go MyClass ^ MyModule ^ Module and does not go to the singleton class
# We want the Module included on the singleton class of MyClass

module MyModule2
    def my_method
        'hello'
    end
end

class MyClass2
    class << self
        include MyModule2
    end
end

puts MyClass2.respond_to?(:my_method)


# Above works, but theres another keyword that simplifies this instead of using include
# "extend"

class MyClass3
    extend MyModule2
end

puts MyClass3.respond_to?(:my_method)


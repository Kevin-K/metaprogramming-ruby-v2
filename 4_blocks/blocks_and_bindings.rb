def my_method
    x = "Goodbye"
    yield("cruel")
end

# blocks capture the scope when created
# the block yielded to retains x= "Hello"
# not the method's x = "Goodbye"
# (undefined variable 'x' if not given)
x = "Hello"
my_method {|y| puts "#{x}, #{y} world" } # => "Hello, cruel world"
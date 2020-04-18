def math(a, b)
    yield(a, b)
end

# ampersand operator, last operator (block)
# can be passed onto other methods. (a defined block)
def do_math(a, b, &operation)
    math(a, b, &operation)
end

do_math(2,3) { |x, y| x * y} # => 6

# drop the & and the block becomes a proc
def my_method(&the_proc)
    the_proc
end

p = my_method {|name| "Hello, #{name}!" }
p.class # => Proc
p.call("Bill") # => "Hello, Bill!"


# use & to go proc to block as well
def another_method(greeting)
    "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" }
another_method("Hello", &my_proc)
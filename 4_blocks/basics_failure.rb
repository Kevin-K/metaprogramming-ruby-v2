def a_method(a, b)
    a + yield(a, b)
end

a_method(1, 2) {|x, y| (x + y) * 3}  # => 10

def b_method
    return yield if block_given?
    'no block'
end

b_method # => "no block"
b_method { "here's a block!" } #=> "here's a block!"

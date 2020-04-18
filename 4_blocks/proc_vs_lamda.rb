# Difference 1: return behavior
# Lamda: returns work like a normal function
def double(callable_object)
    callable_object.call * 2
end

l = lamda { return 10 }
double(l) # => 20

# Block: returns will return from the scope where itself was defined:

def another_double
    p = Proc.new { return 10}
    result = p.call
    return result * 2 # => unreachable code!
end

another_double # => 10

# Difference 2: argument checking
p = Proc.new {|a, b| [a, b] }
p.arity # => 2
p.call(1, 2, 3) # => [1, 2]
p.call(1) # => [1, nil]

x = lambda { |a, b| [a, b] }
x.call(1,2,3) #x => argument error
x.call(1) #x => argument error
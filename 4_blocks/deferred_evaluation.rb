# Procs are block turned object, allowing you to store a block for calling
inc = Proc.new {|x| x + 1 }
# ...
# defer execution till called
inc.call(2) # => 3

# Alternatively use lamda
 dec = lamda {|x| x - 1 }
 dec.class # => Proc
 dec.call(2) # => 1

# stabby lamda (shorthand)
p = ->(x) { x + 1 }
# equal to
p = lamda {|x| x + 1 }
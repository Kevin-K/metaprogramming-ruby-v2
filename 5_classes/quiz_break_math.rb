# make 1 + 1 = 3
# Do so by redefining Fixnum#+ so that it always retursn the correct result plus one:
# ex: 1 + 1 = 3,    2 + 2 = 5,     5 + 1 = 7

module BadMath
    def +(value)
        # super(value)+ 1 # => Yikes stack overflow so not this approach
        super(value) - -1 # => cheeky approach, since we're manipulting + we can sub by -1
        # This works but if we changed out -(value) it could break. See below for using alias to be more "solid"
    end
end


Fixnum.class_eval do
    prepend BadMath
end

#Cleaner approach is the around alias directly on Fixnum
# Note comment out the class_eval to include Badmath and uncomment this block
# class Fixnum
#     alias_method :old_plus, :+
#     def +(value)
#         old_plus(value).old_plus(1)
#     end
# end

puts 1 + 1 # => 3
puts 2 + 2 # => 5
puts 5 + 1 # => 7
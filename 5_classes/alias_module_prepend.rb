# Prepend Wrapper
# global, but cleaner than the alias approach
module ExplicitString
    def length
        super > 5 ? 'long' : 'short'
    end
end

String.class_eval do
    prepend ExplicitString
end

puts "War and Peace".length #=> "long"
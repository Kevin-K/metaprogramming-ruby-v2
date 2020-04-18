module StringRefinement
    refine String do
        def length
            super > 5 ? 'long' : 'short'
        end
    end
end

# Remember refinement usage only applies to end of current file
# This is saffer than a wrap around alias as they are global
using StringRefinement

puts "War and Peace".length # => "long"
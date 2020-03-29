module StringExtensions
    refine String do
        def to_alphanumeric
            gsub(/[^\w\s]/,'')
        end
    end
end

# Refinements: Non-global monkeypatches
# Refinements aren't active by default 
# Refinements are active only within the refine block and the 
# module (or file) using is called within.
# Note on using: only applies to lines BELOW the using statment.

# This will fail:
# "my *1st* refinement!".to_alphanumeric # => NoMethodError

# you must use the extentions to activate
using StringExtensions
"my *1st* refinement!".to_alphanumeric # => "my 1st refinement"

# you can scope refinement usage to within modules
module StringReverseExtensions
    refine String do
        def reverse
            "esrever"
        end
    end
end

module StringStuff
    using StringExtensions
    "my_string".reverse # => "esrever"
end
"my_string".reverse # => "gnirts_my"


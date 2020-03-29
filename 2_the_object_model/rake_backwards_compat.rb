# Rake originally wasn't namespaced
module Rake
    class Task
        # ...
    end
end

# So they added backwards compatibility (for a time)
# by redeclaring namespace scoped classes in the global scope
Task = Rake::Task
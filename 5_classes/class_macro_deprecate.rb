class Book
    def title
        #...
    end
    def lend_to
        #...
    end
    def self.deprecate(old_method, new_method)
        define_method(old_method) do |*args, &block|
            warn "Warning #{old_method}() is deprecated. Use #{new_method}()"
            send(new_method, *args, &block)
        end
    end

    deprecate :GetTitle, :title
    deprecate :LEND_TO_USER, :lend_to
end
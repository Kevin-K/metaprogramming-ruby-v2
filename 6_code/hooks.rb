# Hook 1: inherited
class String
    # Class#inherited does nothing by default, use at your own will
    def self.inherited(subclass)
        puts "#{self} was inherited by #{subclass}"
    end
end

class MyString < String; end

# Hook 2: included
module M1
    # Module#included does nothing by default, use at your own will
    def self.included(other)
        puts "#{self} was included by #{other}"
    end
end

# Hook 3: prepended
module M2
    # Module#prepended does nothing by default, use at your own will
    def self.prepended(other)
        puts "#{self} was prepended by #{other}"
    end
end


# Hook 4: extended
module M3
    # Module#extended does nothing by default, use at your own will
    def self.extended(other)
        puts "#{self} was extended by #{other}"
    end
end

class C
    include M1
    prepend M2
end


# Hook 5: method_added/method_removed/method_undefined
module M4
    # Module#prepended does nothing by default, use at your own will
    def self.method_added(method)
        puts "New method: M4##{method}"
    end
    def my_method; end
end


# There are singleton_method_added/removed/undefined as well
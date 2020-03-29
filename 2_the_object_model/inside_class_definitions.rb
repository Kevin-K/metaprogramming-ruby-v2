# Statements within a class block are executed like
# statements without (thus you can define classes programatically)

3.times do
    class C
        puts "Hello"
    end
end

# Hello gets printed 3 times
# but C is only defined once


# Class blocks are like namespaces, you can open them
# multiple times, but it applies to the same class definition
class D
    def x
        'x'
    end
end

class D
    def y
        'y'
    end
end

# D is block-accessed twice, both x and y are 
# defined as methods of the same class

# obj = D.new
# obj.x
# obj.y

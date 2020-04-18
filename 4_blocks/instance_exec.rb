class C
    def initialize
        @x = 1
    end
end

class D
    def twisted_method
        @y = 2
        C.new.instance_eval { "@x: #{@x}, @y: #{@y}" }
    end
end

# instance_eval uses self scope, so @y is from the object of C
D.new.twisted_method # => "@x: 1, @y: "

# use instance_exec to pass variables in

class E
    def twisted_method
        @y = 2
        C.new.instance_exec(@y) {|y| "@x: #{@x}, @y: #{@y}" }
    end
end

D.new.twisted_method # => "@x: 1, @y: 2"
# class, module, and def (method) scope gate

v1 = 1
class MyClass   # SCOPE GATE: entering class
    v2 = 2
    local_variables #=> ["v2"]
    def my_method # SCOPE GATE: entering def
        v3 = 3
        local_variables
    end           # SCOPE GATE: leaving def
    local_variables # => ["v2"]
end             # SCOPE GATE: leaving class

obj = MyClass.new
obj.my_method # => [:v3]
local_variables # => [:v1, :obj]

# class and module code block: execute immediately
# def block:  executed when called.
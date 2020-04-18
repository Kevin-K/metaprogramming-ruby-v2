my_var = "Success"

class MyClass
    # can't use my_var here due to class Scope Gate

    def my_method
        # can't use my_var here def Scope Gate
    end
end

# use dynamic utilities:
# "flattening the scope" (nested lexical scopes)
# Flat Scope
MyDynamicClass = Class.new do
    puts "#{my_var} in the class definition"

    define_method :my_method do
        puts "#{my_var} in the method"
    end
end

MyDynamicClass.new.my_method
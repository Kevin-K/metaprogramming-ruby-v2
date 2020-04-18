def add_method_to(a_class)
    # class_eval vs instance_eval
    # 1. instance_eval only changes self of the object
    # 2. class_eval changes self and the current class
    # big note: can use class_eval on any instance of a class
    #           to manipulate the class, rather than opening the class with
    #           the class constant name!
    a_class.class_eval do
        def m
            "HELLO"
        end
    end
end
add_method_to(String)
"h".m
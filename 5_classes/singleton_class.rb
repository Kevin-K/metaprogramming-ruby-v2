# opening the singleton class: double arrows onto class keyword with obj in question
# class << obj›
#

obj = Object.new

# capture the singleton class of obj
singleton_class = class << obj
    self
end

singleton_class.class # => Class

# Ruby (> 2.0?)
# use singleton_class method
obj.singleton_class # => #<Class:#<Object0x32948f>>
puts singleton_class == obj.singleton_class # => True

def obj.my_singleton_method
    "hi"
end

obj.singleton_class.instance_methods.grep(/my_/) #=> [:my_singleton_method]



class C
    def a_method
        'C#a_method()'
    end
end

class D < C; end

obj = D.new
obj.a_method # => "C#a_method"


class C
    class << self
        def a_class_method
            'C.a_class_method()'
        end
    end
end

C.singleton_class # => #<Class:C>
D.singleton_class # => #<Class:D>
D.singleton_class.superclass # => #<Class:C>
C.singleton_class.superclass # => #<Class:Object>

# "The superclass of the singleton class, is the singleton class of the superclass"
#
# ----> (Singleton) Class
# ^
# | Superclass
#                                                   Class
#                                                      ^
#                                                      |                    
#                    BasicObject class --------> #BasicObject (singleton class)
#                         ^                            ^
#                         |                            |
#                    Object class ------------> #Object (singleton class)
#                         ^                            ^
#                         |                            |
#                    C class -----------------> #C (singleton class) 
#                    (a_method is here)            (a_class_method is here)
#                         ^                            ^
#                         |                            |
#                    D class  ----------------> #D (singleton class)                  
#                         ^
#                         |
#   obj of class D -> #obj (singleton class)
#                     (a_singleton_method is here)
#

D.a_class_method # => D goes to its singleton class, its singleton class goes to its superclass D-->#D ^ #C
                 # => "C.a_class_method()"
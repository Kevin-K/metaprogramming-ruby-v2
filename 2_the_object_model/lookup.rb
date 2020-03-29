class MyClass
    def my_method
        'my_method()'
    end
end

class MySubClass < MyClass

end

obj = MySubClass.new
obj.my_method() #=> "my_method()"
MySubClass.ancestors #=> [MySubClass, MyClass, Object, Kernel, BasicObject]

# prepend: place the listed class BEFORE this class in the ancestor chain
# include: place the listed class AFTER this class in the ancestor chain
module M1; end
module M2
    include M1
end

module M3
    prepend M1
    include M2
end

# M2's include M1 is ignored since M3 prepend came first in the ancestor chain 
# of M3
M3.ancestors #=> [M1, M3, M2]
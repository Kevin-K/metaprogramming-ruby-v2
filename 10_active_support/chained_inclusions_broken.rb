module SecondLevelModule
    def self.included(base)
        base.extend ClassMethods
    end

    def second_level_instance_method
        'ok'
    end

    module ClassMethods
        def second_level_class_method
            'ok'
        end
    end
end
module FirstLevelModule
    def self.included(base)
        base.extend ClassMethods
    end

    def first_level_instance_method
        'ok'
    end

    module ClassMethods
        def first_level_class_method
            'ok'
        end
    end
    # when this include runs, base is not BaseClass its the FirstLevelModule
    include SecondLevelModule
end

class BaseClass
    include FirstLevelModule
end
x = BaseClass.new

x.first_level_instance_method # => ok
BaseClass.first_level_class_method # => ok
x.second_level_instance_method # => ok
BaseClass.second_level_class_method # => NoMethodError
FirstLevelModule.second_level_class_method # => ok

# Rails added Concerns to encapsulate their fix to the above issue.
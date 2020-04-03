class Lawyer
    def method_missing(method, *args)
        puts "You called: #{method}(#{args.join(', ')})"
        puts "(You also passed it a block)" if block_given?
    end
end

bob = Lawyer.new
bob.talk_simple('a','b') do
    # a block
end
# => You called: talk_simple(a,b)
# => (You also passed it a block)

require './ds.rb'

class Computer
    def initialize(computer_id, data_source)
        @id = computer_id
        @data_source = data_source
    end

    def method_missing(name)
        super if !@data_source.respond_to?("get_#{name}_info") || 
                 !@data_source.respond_to?("get_#{name}_price")
        info = @data_source.send("get_#{name}_info", @id)
        price = @data_source.send("get_#{name}_price", @id)
        result = "#{name.capitalize}: #{info} (#{price})"
        return "* #{result}" if price >= 100
        result
    end
end

my_computer = Computer.new(42, DS.new)
my_computer.cpu # => * Cpu: A CPU ($250)
my_computer.respond_to?(:cpu) # => false (LIES!)

class Computer
    def respond_to_missing?(method, include_private = false)
        (@data_source.respond_to?("get_#{method}_info") && 
         @data_source.respond_to?("get_#{method}_price")) || super
    end
end

my_computer.respond_to?(:cpu) # => true
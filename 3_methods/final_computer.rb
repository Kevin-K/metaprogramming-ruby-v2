class Computer < BasicObject 
    # BasicObject inherit means Blank Slate
    # removes object instance methods (ex: display)
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
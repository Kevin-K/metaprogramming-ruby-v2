# think like an IIFE in JS
lambda {
    setups = []
    events = []
    Kernel.send(:define_method,:setup) do |&block|
        setups << block
    end

    Kernel.send(:define_method,:event) do |description, &block|
        events << {description: description, condition: block}
    end

    Kernel.send(:define_method,:each_setup) do |&block|
        setups.each do |setup|
            block.call(setup)
        end
    end

    Kernel.send(:define_method,:each_event) do |&block|
        events.each do |event|
            block.call(event)
        end
    end
}.call

load 'dsl_events.rb'
each_event do |event|
    env = Object.new # we use Object instead of BasicObject to retain usability of puts
    each_setup do |setup|
        # setup.call # each call will share global scope so can polute @vars
        env.instance_eval(&setup) # makes a Clean Room with an object, no shared @vars
    end
    puts "ALERT: #{event[:description]}" if event[:condition].call
end

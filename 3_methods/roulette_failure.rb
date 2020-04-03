# This is an overly complicated example.
# Why would you treat team members as methods. This is more extensible as
# just a method taking a name. But its a quiz problem

# Broken
class Roulette
    def method_missing(name, *args)
        person = name.to_s.capitalize
        3.times do
            number = rand(10) + 1
            puts "#{number}..."
        end
        "#{person} got a #{number}" # (The problem)
                                    # number is not block defined, so missing here,
                                    # triggering stackoverflow by calling method_missing 
                                    # again
    end
end

# Fixed
class Roulette
    def method_missing(name, *args)
        person = name.to_s.capitalize
        super unless %w[Bob Frank Bill].include? person # Only use for team members
        number = 0 # init number
        3.times do
            number = rand(10) + 1
            puts "#{number}..."
        end
        "#{person} got a #{number}" 
    end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank
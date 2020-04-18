
setup do
    puts "each time: 1"
end

setup do
    puts "each time: 2"
end

event "First event throws" do
    true
end

event "Second event throws" do
    true
end
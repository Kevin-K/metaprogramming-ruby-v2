def explore_array(method)
    code = "['a', 'b', 'c'].#{method}"
    puts "Evaluating: #{code}"
    eval code
end

loop { p explore_array(gets.chomp())}
# run this and just type an array method to the STDIN.
# ex: reverse()
# SECURITY!: try this: object_id; Dir.glob("*")
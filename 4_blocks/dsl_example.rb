def event(descripton)
    puts "ALERT: #{descripton}" if yield
end

event "an event that always happens" do
    true
end


event "an event that never happens" do
    false
end

monthly_sales = 100

event "monthly sales are suspiciously high" do
    monthly_sales > 50
end
event "monthly sales are abysmally low" do
    monthly_sales < 10
end
def to_alphanumeric(s)
    s.gsub(/[^\w\s]/, '')
end
# my_var = "1_23!"
# to_alphanumeric(my_var)

# In Javascript this is sacrilegious.
# In Ruby this is "Open Class".
class String
    def to_alphanumeric
        gsub(/[^\w\s]/, '')
    end
end

# my_var = "1_23!"
# my_var.to_alphanumeric


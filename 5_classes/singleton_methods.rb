str = "a string"
def str.title?
    self.uppercase == self
end

srt.title? # => false

"foo".title? # error
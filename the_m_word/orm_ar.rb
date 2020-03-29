## Example 2
# db.rb specifies Active Record + sqlite db in memory
require './db.rb'

class Show < ActiveRecord::Base
end

# >> show = Show.create(title: "Sillicon Valley", director: "Mike Judge")
# => #<Show id: 1, title: "Sillicon Valley", director: "Mike Judge">
# >> show.save!
# => true
# >> Show.count
# => 1

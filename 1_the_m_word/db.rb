require 'sqlite3'
require 'active_record'

# Set up a database that resides in memory
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :shows, force: true do |t|
    t.string :title
    t.string :director
  end
end
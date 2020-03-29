# Example 1

class Database
    def self.sql(qry)
        puts qry
        []
    end
end

class Entity
    attr_reader :table, :ident
    def initialize(table, ident)
        @table = table
        @ident = ident
        Database.sql "INSERT INTO #{@table} (id) VALUES (#{ident})"
    end

    def set(col,val)
        Database.sql "UPDATE #{@table} SET #{col}='#{val}' WHERE id=#{ident}"
    end

    def get(col)
        Database.sql ("SELECT #{col} FROM #{@table} WHERE id=#{@ident}")[0][0]
    end
end

class Movie < Entity
    def initialize(ident)
        super "movies", ident
    end

    def title
        get "title"
    end

    def title=(value)
        set "title", value
    end

    def director
        get "director"
    end

    def diretor=(value)
        set "director", value
    end
end

# >> movie = Movie.new(1)
# INSERT INTO movies (id) VALUES (1)
# >> movie.title = "Doctor Strangelove"
# UPDATE movies SET title='Doctor Strangelove' WHERE id=1
# >> movie.diretor = "Stanley Kubrick"
# UPDATE movies SET director='Stanley Kubrick' WHERE id=1

# Movie < Entity notes:
# Lots of duplication
# ActiveRecord::Base does most of the lifting for you

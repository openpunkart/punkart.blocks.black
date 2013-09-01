
# NB: just use namespace SportDb::Models (not SportDb::Models::Market)

module SportDb::Models

################################
# extend Game w/ quotes etc.

class Game
  
  has_many   :quotes
   
end  # class Game

end  # module SportDb::Models

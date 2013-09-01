
# NB: just use namespace SportDb::Models (not SportDb::Models::Market)

module SportDb::Models

class Service < ActiveRecord::Base
    
   has_many :event_quotes, :order => 'odds'   # event_(team_winner)_quotes
   has_many :group_quotes, :order => 'odds'   # group_(team_winner)_quotes
   
end  # class Service

end  # module SportDb::Models

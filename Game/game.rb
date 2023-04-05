require_relative './item'
# require 'date'

class Game
    def initialize (multiplayer,last_played_at)
        @multiplayer = multiplayer
        @last_played_at= last_played_at
    end

    def can_be_archived?
        if self == true || last_played_at > 2 
         true

            else
                false
            end
        end
    end

end


end
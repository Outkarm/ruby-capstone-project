require_relative 'music_album'

class genre

    def initialize(name)
        @id = Random.new.rand(1..1000)
        @name = name
        @items = []
    end
end
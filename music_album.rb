require_relative 'item'

class MusicAlbum < Item

    attr_accessor :name, :genres, :publish_date, :on_spotify
    attr_accessor :genre

    def initialize(name)
        
    end
end
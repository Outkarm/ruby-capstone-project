require_relative 'item'

class MusicAlbum < Item

    attr_accessor :name, :genres, :publish_date, :on_spotify
    attr_accessor :genre

    def initialize(name, publish_date, on_spotify: false, genres: [])
        super()
        @name = name
        @publish_date = Date.parse(publish_date)
        @on_spotify = on_spotify
        @genres = genres
    end
end
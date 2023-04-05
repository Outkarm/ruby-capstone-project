require_relative './music_album'
require_relative './genre'

class App
    attr_accessor :music_albums, :genres

    def initialize
        @music_albums = music_albums
        @genres = genres
    end

end
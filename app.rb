require_relative './music_album'
require_relative './genre'

class App
    attr_accessor :music_albums, :genres

    def initialize
        @music_albums = music_albums
        @genres = genres
    end
    def list_music_album
        if @music_albums.empty?
          puts 'No music albums found'
        else
          puts '# Music Albums'
          @music_albums.each_with_index do |music_album, i|
            puts "#{i + 1}. #{music_album}"
          end
        end
      end
end
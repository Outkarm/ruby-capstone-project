require_relative './music_album'
require_relative './genre'
require_relative './store'

class App
  attr_accessor :music_albums, :genres

  def initialize
    @music_albums = []
    @genres = []
    @store = Store.new(self)
    @storage.load_data
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music albums found'
    else
      puts '# Music Albums'
      @music_albums.each_with_index do |music_album, i|
        puts "#{i + 1}. #{music_album}"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'No music genres found'
    else
      puts '# Genres'
      @genres.each_with_index do |genre, i|
        puts "#{i + 1}. #{genre}"
      end
    end
  end

  def add_music_album
    puts '-------------------------'
    puts ' Create music album'
    puts 'Album name:'
    name = gets.chomp
    puts 'On Spotify (y/n)?: '
    on_spotify = gets.chomp.downcase == 'y'
    publish_date = Input.get_date('Published Date: ')

    music_album = MusicAlbum.new(name, publish_date, on_spotify)
    @music_albums << music_album
    puts '*New album added successfully!', music_album.to_s
  end
end

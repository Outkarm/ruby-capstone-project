require_relative './music_album'
require_relative './genre'
require_relative 'selectMenu/menu_list'
require_relative 'selectMenu/select'
require_relative 'item'
require_relative 'Game/game'
require_relative 'Game/author'

class App
  attr_accessor :music_albums, :genres, :game, :author

  def initialize
    @music_albums = music_albums
    @genres = genres
    @game = game
    @author = author
  end
  
  def add_game
    puts 'Adding a new game...'
    print 'Enter game title: '
    title = gets.chomp
    print 'Enter game multiplayer (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter game last played date (YYYY-MM-DD): '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at)
    game.author = add_author
    @game << game
    puts "Game '#{title}' added with ID #{game.id}."
  end

  def add_author
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    puts "Author '#{author.full_name}' added with ID #{author.id}."
    author
  end

  def list_all_games
    puts 'Listing all games...'
    @items.each do |item|
      next unless item.is_a?(Game)

      puts "ID: #{item.id}, Title: #{item.title}, Multiplayer: #{item.multiplayer}, " \
           "Last played at: #{item.last_played_at}, Author: #{item.author.full_name}"
    end
  end

  def list_all_authors
    puts 'Listing all authors...'
    @authors.each do |author|
      puts "ID: #{author.id}, Name: #{author.full_name}"
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

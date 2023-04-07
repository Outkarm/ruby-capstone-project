require_relative 'selectMenu/menu_list'
require_relative 'selectMenu/select'
require_relative 'item'
require_relative 'Game/game'
require_relative 'Game/author'

class App
  attr_accessor :music_albums, :genres, :items, :authors

  def initialize
    @music_albums = music_albums
    @genres = genres
    @games = []
    @authors = []
  end

  def add_game
    puts 'Adding a new game...'
    print 'Enter game title: '
    title = gets.chomp
    print 'Enter game multiplayer (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter game last played date (YYYY-MM-DD): '
    last_played_at = gets.chomp

    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp
    game = Game.new(title, multiplayer, last_played_at, first_name, last_name)
    author = Author.new(first_name, last_name)
    @games << game.to_h
    @authors << author.to_h
    puts "Game '#{title}' added with ID #{game.id}."
    puts "Author '#{author.full_name}' added with ID #{author.id}."
  end

  def list_all_games
    if @games.empty?
      puts 'No Games found'
    else
      puts '# Games'
      @games.each_with_index do |game, i|
        puts "#{i + 1}. #{game}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No music Author found'
    else
      puts '# Authors'
      @authors.each_with_index do |author, i|
        puts "#{i + 1}. #{author}"
      end
    end
  end
end

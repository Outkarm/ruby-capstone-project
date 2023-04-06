require_relative 'selectMenu/menu_list'
require_relative 'selectMenu/select'
require_relative 'item'
require_relative 'Game/game'
require_relative 'Game/author'

class App
  attr_accessor :game, :author

  def initialize
    @game = []
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
  end
end

require_relative 'selectMenu/select'
require_relative 'selectMenu/menu_list'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative './music_album'
require_relative './genre'

class App
  attr_accessor :books, :label
  attr_accessor :music_albums, :genres

  def initialize
    @books = []
    @label = []
    @music_albums = music_albums
    @genres = genres
  end
  

  def colorize_output(color_code, statements)
    puts "\e[#{color_code}m#{statements}\e[0m"
  end

  def colorize_outprint(color_code, statements)
    print "\e[#{color_code}m#{statements}\e[0m"
  end

  def add_book
    puts 'Enter the name of the book:'
    name = gets.chomp
    puts 'Enter the publisher: '
    publisher = gets.chomp
    puts 'Please enter the author name:'
    author = gets.chomp
    puts 'Please enter state of the book: good or bad'
    cover_state = gets.chomp
    if cover_state != 'good' && cover_state != 'bad'
      puts 'Invalid state'
      return
    end
    puts 'Enter the published date of the book: YY-MM-DD'
    date = gets.chomp
    book = Book.new(name, publisher, cover_state, author, date)
    @books << book
    colorize_output(32, "Book '#{name}' was added successfully 🤹‍♂️✅!")
  end

  def add_label
    puts 'Enter the title of label of the book:\n'
    label_title = gets.chomp
    puts 'Enter label color of the book:\n'
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    @label << new_label
    colorize_output(32, "label '#{label_title}' was added successfully 🤹‍♂️✅!")
  end

  def list_all_books
    if @books.empty?
      colorize_output(31, 'No books found 🚫 ')
    else
      puts 'Book List:'
      @books.each_with_index do |book, index|
        print "#{index + 1}-Name: #{book.name}, Publisher: #{book.publisher},
         Cover state: #{book.cover_state}, Publish date: #{book.publish_date}\n\n"
         
         def list_all_labels
    if @labels.empty?
      colorize_output(31, 'No labels found')
    else
      puts "------------------------\n"
      @label.each do |label|
        print "ID: #{label.id} , Label-Title: #{label.title} , Color: #{label.color}\n"
      end
      puts "--------------------------\n\n"
    end
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

require_relative 'classes/book'
require_relative 'classes/label'

class App
  def initialize
    @books = []
    @label = []
  end

  def colorize_output(color_code, statements)
    puts "\e[#{color_code}m#{statements}\e[0m"
  end

  def colorize_outprint(color_code, statements)
    print "\e[#{color_code}m#{statements}\e[0m"
  end

  def add_book
    puts 'Enter the name of the book'
    name = gets.chomp
    puts 'Enter the publisher'
    publisher = gets.chomp
    puts 'Enter the state of the book: good / bad'
    cover_state = gets.chomp
    if cover_state !='good' && cover_state != 'bad'
      puts 'Not a valid state'
      return
    end
    puts 'Enter the published date of the book: YY-MM-DD'
    date = gets.chomp
    book = Book.new(name, publisher, cover_state, publish_date)
    @books << book
    puts 'Enter the title label of the book:\n'
    label_title = gets.chomp
    puts 'Enter label color of the book:\n'
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    @label << new_label
    colorize_output(32, "Book '#{name}' was added successfully!")
  end

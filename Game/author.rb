require_relative 'game'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    # Generate a random ID between 1 and 1000
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def to_h
    { id: @id, author: "#{@first_name} #{@last_name}", first_name: @first_name, last_name: @last_name }
  end
end

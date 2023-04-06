class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name)
    # Generate a random ID between 1 and 1000
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    # Add the item to the array of items
    @items << item
    # Set the item's author to this author
    item.author = self
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end

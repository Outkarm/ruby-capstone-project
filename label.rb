require_relative 'item'

class Label < Item
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color)
    super(id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.labels << self
  end
end

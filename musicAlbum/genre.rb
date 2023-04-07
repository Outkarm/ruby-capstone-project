require_relative 'music_album'

class Genre
  attr_reader :name, :items

  def initialize(name)
    @id = Random.new.rand(1..1000)
    @name = name
    @items = []
  end

  def to_s
    "#{self.class} ID: #{@id} name: #{@name} "
  end

  def to_h
    { id: @id, name: @name, items: @items.to_s }
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end
end

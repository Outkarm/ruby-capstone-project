require_relative '../item'

class Book < Item
  attr_accessor :id, :name, :publisher, :cover_state

  def initialize(name, publisher, cover_state, publish_date, id = Random.rand(1..1000))
    super(publish_date)
    @id = id
    @name = name
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  def can_be_archived?
    if super || cover_state == 'bad'
      true
    else
      false
    end
  end
end
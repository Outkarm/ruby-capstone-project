require_relative 'item'

class Book < Item
  attr_accessor :id, :publisher, :cover_state

  def initialize(publisher, cover_state, id = Random.rand(1..1000))
    super(publish_date)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if super || cover_state == 'bad'
      true
    else
      false
    end
  end
end

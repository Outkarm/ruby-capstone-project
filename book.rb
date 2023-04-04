require_relative 'item'

class Book < Item

  attr_accessor :id = Random.rand(1..1000), :publisher, :cover_state

  def initialize (id, publisher, cover_state)
    super(publish_date)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end
end

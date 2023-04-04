require 'date'

class Item
  attr_accessor :id, :published_date, :archived, :label, :genre, :author, :source

  def initialize(*)
    @id = Random.rand(1..1000)
    @published_date = nil
    @archived: false
    @label = nil
    @genre = nil
    @author = nil
    @source = nil
  end
end

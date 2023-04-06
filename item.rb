require 'date'

class Item
  attr_accessor :id, :published_date, :archived, :label, :genre, :author, :source

  def initialize(*)
    @id = Random.rand(1..1000)
    @published_date = nil
    @archived = false
    @label = nil
    @genre = nil
    @author = author
    @source = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  private

  def can_be_archived?
    begin
      publish_date = Date.parse(@publish_date)
    rescue StandardError
      publish_date = nil
    end
    if publish_date.nil?
      false
    else
      (Date.today.year - publish_date.year) > 10
    end
  end
end

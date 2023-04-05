require 'date'

class Item
  attr_accessor :id, :published_date, :archived, :label, :genre, :author, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @published_date = publish_date
    @archived = archived
    @label = label
    @genre = nil
    @author = nil
    @source = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
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

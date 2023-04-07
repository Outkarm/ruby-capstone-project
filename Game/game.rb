require_relative '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :id, :title

  def initialize(title, multiplayer, last_played_at, first_name, last_name)
    super(publish_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @first_name = first_name
    @last_name = last_name
  end

  def can_be_archived?
    DateTime.now.year - Date.parse(@last_played_at).year > 2 && super()
  end

  def to_h
    { id: @id, title: @title, author: "#{@first_name} #{@last_name}", last_played_at: @last_played_at,
      multiplayer: @multiplayer }
  end
end

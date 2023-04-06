require_relative '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super()
  end

  def can_be_archived?
    DateTime.now.year - Date.parse(@last_played_at).year > 2 && super()
  end
end

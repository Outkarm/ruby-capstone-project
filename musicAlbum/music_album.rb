require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :genres, :publish_date, :on_spotify, :genre

  def initialize(name, publish_date, on_spotify: false, genres: [])
    super()
    @name = name
    @publish_date = Date.parse(publish_date)
    @on_spotify = on_spotify
    @genres = genres
  end

  def can_be_archived?
    super && @on_spotify
  end
end

require_relative '../item'

class MusicAlbum < Item
  attr_accessor :name, :genres, :publish_date, :on_spotify, :genre

  def initialize(name, published_date, on_spotify, genres: [])
    super(publish_date)
    @name = name
    @published_date = Date.parse(published_date)
    @on_spotify = on_spotify
    @genres = genres
  end

  def can_be_archived?
    super && @on_spotify
  end
end

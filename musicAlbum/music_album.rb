require_relative '../item'

class MusicAlbum < Item
  attr_accessor :name, :genres, :publish_date, :on_spotify, :genre

  def initialize(name, published_date, on_spotify, genres: [])
    super(publish_date)
    @name = name
    @published_date = published_date
    @on_spotify = on_spotify
    @genres = genres
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "<#{self.class} ID: #{@id}> " \
      "[name: #{@name}, publish_date: #{@publish_date}, on_spotify: #{@on_spotify}]"
  end
  def to_h
    { id: @id, name: @name, artist: @artist, publish_date: @publish_date.to_s, on_spotify: @on_spotify }
  end
end

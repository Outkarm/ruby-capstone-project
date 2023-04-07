require 'json'

class Store
  def initialize(app)
    @app = app
    @music_file = './data/music_album.json'.freeze
    @genre_file = './data/label.json'.freeze
  end

  def save_data
    save_genre
    save_music_album
  end

  def load_data
    load_genre
    load_music_album
  end

  private

  def save_label
    genre = @app.label_list.map(&:to_h)
    File.write(@genre_file, JSON.generate(genre))
  end

  def save_music_albums
    music_album = @app.music_album_list.map(&:to_h)
    File.write(@music_file, JSON.generate(music_album))
  end

  def load_genre(filename, array)
    genres = read_file(filename)
    genres.each do |genre|
      name = genre['name']
      array << Genre.new(name)
    end
  end

  def load_music_albums(filename, array)
    music_albums = read_file(filename)
    music_albums.each do |music_album|
      name = music_album['name']
      artist = music_album['artist']
      publish_date = music_album['publish_date']
      on_spotify = music_album['on_spotify']
      array << MusicAlbum.new(name, artist, publish_date, on_spotify)
    end
  end
end

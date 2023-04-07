require 'json'

class Store
  MUSIC_FILE = './data/music_album.json'.freeze
  GENRE_FILE = './data/genre.json'.freeze
  def initialize(app)
    @app = app
  end

  def save_data
    # save_genre
    save_music_album
  end

  def load_data
    load_genre(GENRE_FILE, @app.genres)
    load_music_album(MUSIC_FILE, @app.music_albums)
  end

  private

  # def save_genre
  #   genre = @app.list_all_genres.map(&:to_h)
  #   File.write(GENRE_FILE, JSON.generate(genre))
  # end

  def save_music_album
    music_album = @app.list_all_music_albums.map(&:to_h)
    File.write(MUSIC_FILE, JSON.generate(music_album))
  end

  def load_genre(filename, array)
    genres = read_file(filename)
    genres.each do |genre|
      name = genre['name']
      array << Genre.new(name)
    end
  end

  def load_music_album(filename, array)
    music_albums = read_file(filename)
    music_albums.each do |music_album|
      name = music_album['name']
      publish_date = music_album['publish_date']
      on_spotify = music_album['on_spotify']
      array << MusicAlbum.new(name, publish_date, on_spotify)
    end
  end

  def read_file(filename)
    return [] unless File.exist?(filename)

    file = File.open(filename)
    data = file.read
    file.close
    return JSON.parse(data) unless data.empty?

    []
  end
end

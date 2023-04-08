require 'json'

class Store
  MUSIC_FILE = './data/music_album.json'.freeze
  GENRE_FILE = './data/genre.json'.freeze
  AUTHORS_FILE = './data/authors.json'.freeze
  GAME_FILE = './data/game.json'.freeze
  def initialize(app)
    @app = app
  end

  def save_data
    save_genre
    save_music_album
  end

  def save_game_data
    save_author
    save_game
  end

  def load_data
    load_genre(GENRE_FILE, @app.genres)
    load_music_album(MUSIC_FILE, @app.music_albums)
    load_authors(AUTHORS_FILE, @app.authors)
    load_games(GAME_FILE, @app.games)
  end

  private

  def save_genre
    genre = @app.list_all_genres.map(&:to_h)
    File.write(GENRE_FILE, JSON.generate(genre))
  end

  def save_author
    authors = @app.list_all_authors.map(&:to_h)
    File.write(AUTHORS_FILE, JSON.generate(authors))
  end

  def save_music_album
    music_album = @app.list_all_music_albums.map(&:to_h)
    File.write(MUSIC_FILE, JSON.generate(music_album))
  end

  def save_game
    games = @app.list_all_games.map(&:to_h)
    File.write(GAME_FILE, JSON.generate(games))
  end

  def load_genre(filename, array)
    genres = read_file(filename)
    genres.each do |genre|
      name = genre['name']
      array << Genre.new(name)
    end
  end

  def load_authors(filename, array)
    authors = read_file(filename)
    authors.each do |author|
      first_name = author['first_name']
      last_name = author['last_name']
      array << Author.new(first_name, last_name)
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

  def load_games(filename, array)
    games = read_file(filename)
    games.each do |game|
      title = game['title']
      last_played_at = game['last_played_at']
      multiplayer = game['multiplayer']
      first_name = game['first_name']
      last_name = game['label_title']
      games = Game.new(title, multiplayer, last_played_at, first_name, last_name)
      array << games.to_h
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

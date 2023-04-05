class Select
  OPTIONS = {
    1 => :add_book,
    2 => :add_music_album,
    3 => :add_movie,
    4 => :add_game,
    5 => :list_all_books,
    6 => :list_all_music_albums,
    7 => :list_all_movies,
    8 => :list_all_games,
    9 => :exit_app
  }.freeze

  def initialize
    @app = nil
  end

  def opt_select(opt)
    action = OPTIONS[opt]
    if action.nil?
      puts 'Option entered is invalid'
    else
      send(action)
    end
  end

  private

  def add_book
    @app.add_book
  end

  def add_music_album
    @app.add_music_album
  end

  def add_movie
    @app.add_movie
  end

  def add_game
    @app.add_game
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_music_albums
    @app.list_all_music_albums
  end

  def list_all_movies
    @app.list_all_movies
  end

  def list_all_games
    @app.list_all_games
  end

  def exit_app
    puts 'Thanks for using this app'
    exit
  end
end

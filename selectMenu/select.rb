class Select
  def initialize
    @app = nil
  end

  def opt_select(opt)
    case opt
    when 1
      @app.add_book
    when 2
      @app.add_music_album
    when 3
      @app.add_movie
    when 4
      @app.add_game
    when 5
      @app.list_all_books
    when 6
      @app.list_all_music_albums
    when 7
      @app.list_all_movies
    when 8
      @app.list_all_games
    when 9
      puts 'Thanks for using this app'
      exit
    else
      puts 'Option entered is invalid'
    end
  end
end

class Select
  def initialize
    @app = nil
  end

  def opt_select(opt)
    case opt
    when 1 then @app.add_book
    when 2 then @app.add_music_album
    when 3 then @app.add_movie
    when 4 then @app.add_game
    when 5 then @app.list_all_books
    when 6 then @app.list_all_music_albums
    when 7 then @app.list_all_movies
    when 8 then @app.list_all_games
    when 9 then @app.list_all_genres
    when 10 then @app.list_all_labels
    when 11 then @app.list_all_authors
    when 12 then @app.list_all_sources
    when 13 then exit puts 'Thanks for using this app'
    else puts 'Option entered is invalid'
    end
  end
end

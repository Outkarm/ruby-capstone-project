def select_option(opt, app)
  options = {
    1 => -> { app.add_book },
    2 => -> { app.add_music_album },
    3 => -> { app.add_movie },
    4 => -> { app.add_game },
    5 => -> { app.list_all_books },
    6 => -> { app.list_all_music_albums },
    7 => -> { app.list_all_movies },
    8 => -> { app.list_all_games },
    9 => -> { app.list_all_genres },
    10 => -> { app.list_all_lables },
    11 => -> { app.list_all_authors },
    12 => -> { app.list_all_sources },
    0 => lambda {
      puts 'Thanks for using this app'
      app.close
      exit
    }
  }

  action = options[opt]
  return puts 'Option entered is invalid' if action.nil?

  action.call
end

def select_option(opt, app)
  options = {
    1 => -> { app.add_book },
    2 => -> { app.add_music_album },
    3 => -> { app.add_game },
    4 => -> { app.list_all_books },
    5 => -> { app.list_all_music_albums },
    6 => -> { app.list_all_games },
    7 => -> { app.list_all_genres },
    8 => -> { app.list_all_labels },
    9 => -> { app.list_all_authors },
    0 => lambda {
      puts 'Thanks for using this app'
      exit
    }
  }

  action = options[opt]
  return puts 'Option entered is invalid' if action.nil?

  action.call
end

def select_option(opt, app)
  options = {
    1 => :add_book,
    2 => :add_music_album,
    3 => :add_movie,
    4 => :add_game,
    5 => :list_all_books,
    6 => :list_all_music_albums,
    7 => :list_all_genres,
    8 => :list_all_movies,
    9 => :list_all_games,
    0 => :exit_app
  }

  action = options[opt]
  return puts 'Option entered is invalid' if action.nil?

  case action
  when :add_book
    app.add_book
  when :add_music_album
    app.add_music_album
  when :add_movie
    app.add_movie
  when :add_game
    app.add_game
  when :list_all_books
    app.list_all_books
  when :list_all_music_albums
    app.list_all_music_albums
  when :list_all_genres
    app.list_all_genres
  when :list_all_movies
    app.list_all_movies
  when :list_all_games
    app.list_all_games
  when :exit_app
    puts 'Thanks for using this app'
    exit
  end
end

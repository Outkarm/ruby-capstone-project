require 'json'

class Store
   music_file = './data/music_album.json'.freeze
   label_file = './data/label.json'.freeze

   def initialize(app)
      @app = app
   end
   def save_data
      save_label
      save_music_album
   end
   def load_data
      load_label
      load_music_album
   end
   private
   def save_label
      label = @app.label_list.map(&:to_h)
      File.write(label_file, JSON.generate(label))
    end
  
    def save_music_albums
      music_album = @app.music_album_list.map(&:to_h)
      File.write(music_file, JSON.generate(music_album))
    end
end
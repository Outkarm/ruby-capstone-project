require_relative '../musicAlbum/genre'
require_relative '../musicAlbum/music_album'

describe Genre do
  before :all do
    @genre = Genre.new('Rock')
    @music_album = MusicAlbum.new('All things new.', '2022-10-11', false)
  end

  describe '#new' do
    it 'should be a Genre object' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'should return correct Genre name' do
      expect(@genre.name).to eql 'Comedy'
    end
  end
end

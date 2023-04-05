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
      expect(@genre.name).to eql 'Rock'
    end
  end
  describe '#add_item' do
    context 'before adding any item' do
      it 'should have an empty list' do
        expect(@genre.items.length).to eql 0
      end
    end

    context 'after adding a music album' do
      it 'should contain exactly one item' do
        @genre.add_item(@music_album)
        expect(@genre.items.length).to eql 1
      end

      it 'should return the correct music album' do
        expect(@genre.items[0]).to eql @music_album
      end
    end
  end
end

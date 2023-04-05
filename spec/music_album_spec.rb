require 'rspec'
require_relative '../item'
require_relative '../musicAlbum/music_album'

describe MusicAlbum do
    before(:all) do
        @music = MusicAlbum.new('Earth Wind and Fire', '1999-12-10', true)
    end
    describe '#can_be_archived?' do
        it 'exists' do
            expect(@music).to respond_to(:can_be_archived?)
        end
        it 'returns false' do
            expect(@music.can_be_archived?).to be_truthy
        end
    end
end
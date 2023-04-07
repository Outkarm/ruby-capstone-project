require 'rspec'
require_relative '../item'
require_relative '../Game/game'

RSpec.describe Game do
  describe '#can_be_archived?' do
    context 'when the game was last played more than 2 years ago' do
      it 'returns true' do
        game = described_class.new('Super Mario Bros.', true, '2019-01-01', 'Shigeru', 'Miyamoto')
        expect(game.can_be_archived?).to be false
      end
    end

    context 'when the game was last played less than 2 years ago' do
      it 'returns false' do
        game = described_class.new('The Legend of Zelda', false, '2022-03-01', 'Eiji', 'Aonuma')
        expect(game.can_be_archived?).to be false
      end
    end
  end
end

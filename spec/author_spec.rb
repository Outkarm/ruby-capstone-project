require_relative '../Game/author'
require_relative '../Game/game'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }

  describe '#initialize' do
    it 'generates a random ID between 1 and 1000' do
      expect(author.id).to be_between(1, 1000)
    end

    it 'sets the first name and last name' do
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end

    it 'initializes an empty array of items' do
      expect(author.items).to eq([])
    end
  end

  describe '#add_item' do
    let(:item) { double('Item') }

    it 'adds the author to the item\'s list of authors' do
      expect(item).to receive(:add_author).with(author)
      author.add_item(item)
    end
  end

  describe '#full_name' do
    it 'returns the author\'s full name' do
      expect(author.full_name).to eq('John Doe')
    end
  end

  describe '#to_h' do
    it 'returns a hash with the author\'s ID and full name' do
      expect(author.to_h).to eq({ id: author.id, author: 'John Doe', first_name: 'John', last_name: 'Doe' })
    end
  end
end

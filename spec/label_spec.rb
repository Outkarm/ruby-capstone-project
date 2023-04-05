require_relative '../classes/label'
require_relative '../classes/book'
require 'date'

describe Label do
  context 'Testing the label class' do
    book = Book.new('Good to Great', 'publisher', 'best', '2020/7/09')
    label = Label.new(' Book-label', 'white')

    it 'Should validate the label title' do
      expect(label.title).to eq ' Book-label'
    end

    it 'Should validate the label title' do
      expect(label.color).to eq 'white'
    end

    it 'should add book item object to label items array' do
      label.add_item(book)
      expect(label.items[0]).to eq book
    end
  end
end

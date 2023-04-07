# require 'date'
require_relative '../classes/book'

describe Book do
  context 'Testing the book class' do
    it 'A newly created book has a title of type String' do
      book = Book.new('Good to Great', 'Jim Collins', 'Best', '2001-10-16')
      expect(book.name).not_to be_nil
      expect(book.name).to be_a(String)
    end

    it 'should detect the book title' do
      book = Book.new('title', 'name', 'cover_state', '2001-02-20')
      expect(book.name).to eq 'title'
    end

    it 'should detect the book publisher' do
      book = Book.new('name', 'publisher', 'cover_state', '2005-07-10')
      expect(book.publisher).to eq 'publisher'
    end

    it 'should detect the book cover_state' do
      book = Book.new('name', 'author', 'cover_state', '2005-07-10')
      expect(book.cover_state).to eq 'cover_state'
    end

    it 'detect the book publish_date' do
      book = Book.new('name', 'author', 'cover_state', '2005-07-10')
      expect(Date.parse(book.publish_date)).to eq Date.parse('2005-07-10')
    end
  end
end

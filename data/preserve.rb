# require 'json'

# def save_data
#   File.open('book.json', 'w') do |file|
#     books = @books.each_with_index.map do |book, index|
#       { name: book.name,
#         publisher: book.publisher,
#         author: author,
#         date: date,
#         index: index }
#     end
#     file.write(JSON.pretty_generate(books))
#   end
# end

# def read_data
#   return [] unless File.exist?('book.json')

#   books_json = JSON.parse(File.read('book.json'))
#   books_json.map do |_book|
#     Book.new(name, publisher, cover_state, author, date)
#   end
# end

require 'json'

def save_data(data, file)
  hashed_data = data.map(&:to_h)
  json = JSON.generate(hashed_data)
  formatted_json = json.gsub('},{', "},\n{") #-----add new line after each object-------#
  File.write(file, formatted_json)
end

def read_data(file)
  if File.exist?(file)
    data = File.read(file)
    JSON.parse(data)
  else
    []
  end
end

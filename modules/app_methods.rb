require_relative '../classes/book'
require_relative '../classes/label'

module Methods
  # create a book
  def add_book
    data = book_inputs
    @books << Book.new(data[0], data[1], data[2])
    puts "\nThanks!"
    puts 'This book created:'
    puts "Publisher: #{data[0]}, Cover_state: #{data[1]}, Published_Date: #{data[2]}"
  end

  # create a label
  def add_label
    data = label_inputs
    @labels << Label.new(data[0], data[1])
    puts "\nThanks!"
    puts 'This label created:'
    puts "Title: #{data[0]}, Color: #{data[1]}"
  end

  def list_books
    puts 'List of the books:'
    @books.each_with_index do |book, i|
      puts "#{i}:) Publisher: #{book.publisher}, Cover_state: #{book.cover_state}"
    end
  end

  def list_labels
    puts 'List of the labels:'
    @labels.each_with_index do |label, i|
      puts "#{i}:) Title: #{label.title}, Color: #{label.color}"
    end
  end
end

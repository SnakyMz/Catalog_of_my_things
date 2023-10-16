# This method prints the options the user can choose from and gets the user input
def display_options
  puts "\nPlease choose an option by entering a number:"
  puts '1 - Add a music album'
  puts '2 - list all music albums'
  puts '3 - list all genres'
  puts '4 - Add a book'
  puts '5 - list all books'
  puts '6 - list all labels'
  puts '7 - Add a game'
  puts '8 - list all games'
  puts '9 - list all authors'
  puts '10 - Exit'
end

def main
  loop do
    display_options
    option = gets.chomp.to_i
    if option == 10
      puts 'Thank you for using the app. Goodbye!'
      break
    end
  end
end

main

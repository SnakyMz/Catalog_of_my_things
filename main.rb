require_relative 'app'
require_relative 'user_input'

# This method prints the options the user can choose from and gets the user input
def display_options
  puts "\nPlease choose an option by entering a number:"
  puts '1  - list all books'
  puts '2  - list all music albums'
  puts '3  - list all games'
  puts '4  - list all genres'
  puts '5  - list all labels'
  puts '6  - list all authors'
  puts '7  - Add a book'
  puts '8  - Add a music album'
  puts '9  - Add a game'
  puts '10 - Exit'
end

def main
  app = App.new
  puts 'Welcome to Catalog of my things'
  loop do
    display_options
    option = user_input('Your option: ').to_i
    app.run(option)
  end
end

main
